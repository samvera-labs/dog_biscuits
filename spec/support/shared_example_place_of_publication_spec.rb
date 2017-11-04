# frozen_string_literal: true

shared_examples_for 'place_of_publication' do
  it 'has place_of_publication' do
    expect(stubby.place_of_publication).to eq(['Salford'])
  end
  it 'has place_of_publication predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/pup')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:place_of_publication)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:place_of_publication].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:place_of_publication)))
  end
end
