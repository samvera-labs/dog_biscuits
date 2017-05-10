# frozen_string_literal: true

shared_examples_for 'origin_date' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has origin date' do
    expect(stubby.origin_date).to eq('2012')
  end

  it 'has origin date predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/originDate')))
  end
end
