# frozen_string_literal: true

shared_examples_for 'source' do
  it 'has source' do
    expect(stubby.source).to eq(['tomato'])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/source')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:source)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:source].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:source)))
  end
end
