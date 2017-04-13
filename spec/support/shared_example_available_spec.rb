# frozen_string_literal: true

shared_examples_for 'available' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has date available' do
    expect(stubby.date_available).to eq('2015')
  end

  it 'has date available predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/available')))
  end
end
