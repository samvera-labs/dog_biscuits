# frozen_string_literal: true

shared_examples_for 'resource_type' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has resource type' do
    expect(stubby.resource_type).to eq(['Software'])
  end
  it 'has type predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/type')))
  end
end
