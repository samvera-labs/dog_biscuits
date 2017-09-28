# frozen_string_literal: true

shared_examples_for 'doi' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has doi' do
    expect(stubby.doi).to eq(['xxx-xxx-xxx'])
  end
  it 'has doi predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/doi')))
  end
end
