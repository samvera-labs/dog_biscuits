# frozen_string_literal: true

shared_examples_for 'publication_status' do
  it 'has publication_status' do
    expect(stubby.publication_status).to eq(['Published'])
  end
  it 'has status predicate' do
    expect(rdf.should(include('http://purl.org/ontology/bibo/status')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:publication_status)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:publication_status].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:publication_status)))
  end
end
