shared_examples_for 'generic_workflow' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a xxx' do
    expect(@stubby.xxx).to eq(['xxx-xxx-xxx'])
  end
  it 'will have the xxx predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('xxx')))
  end
end
