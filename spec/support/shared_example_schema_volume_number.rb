# frozen_string_literal: true

shared_examples_for 'volume_number' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has volume number' do
    expect(stubby.volume_number).to eq('volume_number_test')
  end
  it 'has volume number predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/volumeNumber')))
  end
end
