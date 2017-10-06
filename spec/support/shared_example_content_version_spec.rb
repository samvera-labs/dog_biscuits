# frozen_string_literal: true

shared_examples_for 'content_version' do
  it 'has content_version' do
    expect(stubby.content_version).to eq(['AM'])
  end
  it 'has content_version predicate' do
    expect(rdf.should(include('http://schema.org/version')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:content_version))) if stubby.work?
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:content_version].should(be_truthy))
  end
end
