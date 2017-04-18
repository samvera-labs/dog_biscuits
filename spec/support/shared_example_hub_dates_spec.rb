# frozen_string_literal: true

shared_examples_for 'hub_dates' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has dates' do
    expect(stubby.dates).to eq('1500-1550')
  end
  it 'has dates predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://data.archiveshub.ac.uk/def/dates')))
  end
end
