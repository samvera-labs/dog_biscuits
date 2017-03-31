shared_examples_for 'foaf_name' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has name' do
    expect(@stubby.name).to eq('name')
  end
  it 'has name predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/name')))
  end
end
