shared_examples_for 'last_access' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has last_access' do
    expect(@stubby.last_access).to eq('2016-01-01')
  end
  it 'has last_access predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#lastAccess')))
  end
end
