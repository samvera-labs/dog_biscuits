# frozen_string_literal: true

shared_examples_for 'date' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has date' do
    expect(stubby.date).to eq(['2016-01-01'])
  end
  it 'has date predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/date')))
  end
end
