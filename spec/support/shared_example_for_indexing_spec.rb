# frozen_string_literal: true

shared_examples_for 'for_indexing' do
  it 'has for_indexing' do
    expect(stubby.for_indexing).to eq(['lovely stuff for indexing'])
  end
  it 'has for_indexing predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#forIndexing')))
  end
end
