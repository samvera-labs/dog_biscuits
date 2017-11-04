# frozen_string_literal: true

shared_examples_for 'official_url' do
  it 'has official_url' do
    expect(stubby.official_url).to eq(['http://www.london.ac.uk'])
  end
  it 'has official_url predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/uri')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:official_url)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:official_url].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:official_url)))
  end
end
