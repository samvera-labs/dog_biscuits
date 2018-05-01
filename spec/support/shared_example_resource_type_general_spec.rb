# frozen_string_literal: true

shared_examples_for 'resource_type_general' do
  it 'has resource_type_general' do
    expect(stubby.resource_type_general).to eq(['Sound'])
  end

  it 'has resource_type_general predicate' do
    expect(rdf.should(include('http://purl.org/spar/datacite/hasGeneralResourceType')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:resource_type_general)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:resource_type_general].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:resource_type_general)))
  end
end
