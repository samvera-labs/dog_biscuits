# frozen_string_literal: true

shared_examples_for 'resource_type' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has resource type' do
    expect(@stubby.resource_type).to eq(['Software'])
  end
  it 'has type predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/type')))
  end
end
