# frozen_string_literal: true

shared_examples_for 'date_submitted' do
  it 'has date submitted' do
    expect(stubby.date_submitted).to eq(['2013'])
  end
  it 'has date submitted predicate' do
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#dateSubmitted')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_submitted)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_submitted].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_submitted)))
  end
end
