# frozen_string_literal: true

shared_examples_for 'identifier' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has identifier' do
    expect(stubby.identifier).to eq(['identifier_test'])
  end
  it 'has identifier predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/identifier')))
  end
end
