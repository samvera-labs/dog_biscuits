# frozen_string_literal: true

shared_examples_for 'embargo_release' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has embargo_release' do
    expect(stubby.embargo_release).to eq(2016 - 12 - 12)
  end
  it 'has embargo_release predicate' do
    expect(rdf.should(include('http://purl.org/spar/fabio/hasEmbargoDate')))
  end
end
