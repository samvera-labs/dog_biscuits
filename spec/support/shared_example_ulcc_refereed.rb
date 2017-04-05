shared_examples_for 'refereed' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has refereed' do
    expect(@stubby.refereed).to eq(true)
  end
  it 'has refereed predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#refereed')))
  end
end
