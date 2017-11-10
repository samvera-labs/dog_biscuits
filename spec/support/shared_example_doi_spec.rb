# frozen_string_literal: true

shared_examples_for 'doi' do
  it 'has doi' do
    expect(stubby.doi).to eq(['xxx-xxx-xxx'])
  end
  it 'has doi predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/doi')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:doi)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:doi].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:doi)))
  end
end
