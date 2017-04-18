# frozen_string_literal: true

shared_examples_for 'content_version' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has content_version' do
    expect(stubby.content_version).to eq(['AM'])
  end
  it 'has content_version predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/version')))
  end
end
