shared_examples_for 'module_code' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a former identifier' do
    expect(@stubby.module_code).to eq(['XXXXXX'])
  end
  it 'will have the foaf.name predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#moduleCode')))
  end
end
