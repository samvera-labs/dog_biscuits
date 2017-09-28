# frozen_string_literal: true

shared_examples_for 'foaf_name' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has name' do
    expect(stubby.name).to eq('The Smiths')
  end
  it 'has name predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/name')))
  end
end
