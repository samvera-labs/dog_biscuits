# frozen_string_literal: true

shared_examples_for 'date_issued' do
  it 'has date_issued' do
    expect(stubby.date_issued).to eq(['2017'])
  end

  it 'has date_issued predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/issued')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_issued)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_issued].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_issued)))
  end
end
