# frozen_string_literal: true

shared_examples_for 'pagination' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has an pagination' do
    expect(@stubby.pagination).to eq('pagination_test')
  end
  it 'has pagination predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/pagination')))
  end
end
