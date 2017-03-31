shared_examples_for 'generic_qualifier' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has qualifier' do
    expect(@stubby.qualifier).to eq('order of the phoenix')
  end
  it 'has qualifier predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#qualifier')))
  end
end
