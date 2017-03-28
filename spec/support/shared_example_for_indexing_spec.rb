shared_examples_for 'for_indexing' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a for_indexing' do
    expect(@stubby.for_indexing).to eq(['lovely stuff for indexing'])
  end
  it 'will have the for_indexing predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#forIndexing')))
  end
end
