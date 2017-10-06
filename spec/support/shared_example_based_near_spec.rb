# frozen_string_literal: true

shared_examples_for 'based_near' do
  # TODO: create proper test and add to thesis
  it 'has based_near' do
    expect(stubby.based_near).to eq([])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/basedNear')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:based_near)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:based_near].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:based_near)))
  end
end
