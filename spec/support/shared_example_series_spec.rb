# frozen_string_literal: true

shared_examples_for 'series' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has series' do
    expect(stubby.series).to eq(['The Woeful Series'])
  end
  it 'has series predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/hasSeries')))
  end
end
