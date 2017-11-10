# frozen_string_literal: true

shared_examples_for 'foaf_name' do
  it 'has name' do
    expect(stubby.name).to eq('The Smiths')
  end
  it 'has name predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/name')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:name))) if stubby.work?
  end
end
