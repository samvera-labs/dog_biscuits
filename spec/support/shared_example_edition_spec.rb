# frozen_string_literal: true

shared_examples_for 'edition' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has edition' do
    expect(stubby.edition).to eq(['First Edition'])
  end
  it 'has edition predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/edition')))
  end
end
