# frozen_string_literal: true

shared_examples_for 'generic_qualifier' do
  it 'has qualifier' do
    expect(stubby.qualifier).to eq('order of the phoenix')
  end
  it 'has qualifier predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#qualifier')))
  end
end
