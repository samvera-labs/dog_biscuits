# frozen_string_literal: true

shared_examples_for 'resource_type' do
  it 'has resource type' do
    expect(stubby.resource_type).to eq(['Software'])
  end
  it 'has type predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/type')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:resource_type)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:resource_type].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:resource_type)))
  end
end
