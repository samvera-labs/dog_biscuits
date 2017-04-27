# frozen_string_literal: true

shared_examples_for 'edition' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has edition' do
    expect(stubby.edition).to eq(['First Edition'])
  end
  it 'has edition predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/edition')))
  end
end
