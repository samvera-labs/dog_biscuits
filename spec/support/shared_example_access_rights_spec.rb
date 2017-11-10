# frozen_string_literal: true

shared_examples_for 'access_rights' do
  it 'has access rights' do
    expect(stubby.dc_access_rights).to eq(['access rights'])
  end

  it 'has access rights predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/accessRights')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:dc_access_rights)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:dc_access_rights].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:dc_access_rights)))
  end
end
