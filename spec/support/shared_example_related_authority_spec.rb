# frozen_string_literal: true

shared_examples_for 'related_authority' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has related authority' do
    expect(stubby.related_authority).to eq(['related authority'])
  end
  it 'has related authority predicate' do
    expect(rdf.should(include('http://www.loc.gov/mads/rdf/v1#hasRelatedAuthority')))
  end
end
