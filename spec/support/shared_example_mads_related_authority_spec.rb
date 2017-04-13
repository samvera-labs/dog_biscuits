# frozen_string_literal: true

shared_examples_for 'mads_related_authority' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has related authority' do
    expect(stubby.related_authority).to eq(['related authority'])
  end
  it 'has related authority predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.loc.gov/mads/rdf/v1#hasRelatedAuthority')))
  end
end
