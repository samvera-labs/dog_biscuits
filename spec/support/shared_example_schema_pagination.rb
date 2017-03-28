shared_examples_for 'pagination' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have an pagination' do
    expect(@stubby.pagination).to eq('pagination_test')
  end
  it 'will have the schema:pagination predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/pagination')))
  end
end

