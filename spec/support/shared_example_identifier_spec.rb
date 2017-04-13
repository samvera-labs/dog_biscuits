# frozen_string_literal: true

shared_examples_for 'identifier' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has identifier' do
    expect(stubby.identifier).to eq(['identifier_test'])
  end
  it 'has identifier predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/identifier')))
  end
end
