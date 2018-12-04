# frozen_string_literal: true

shared_examples_for 'date_available' do
  it 'has date available' do
    expect(stubby.date_available).to eq(['2015'])
  end

  it 'has date available predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/available')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_available)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_available].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_available)))
  end
end
