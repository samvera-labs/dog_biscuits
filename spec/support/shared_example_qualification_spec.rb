shared_examples_for 'qualification' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)

  end
  # metadata
  it 'has qualification name' do
    expect(@stubby.qualification_name).to eq(['qualification'])
  end
  it 'has an qualification level' do
    expect(@stubby.qualification_level).to eq(['PhD'])
  end

  # predicates
  it 'has qualification level predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'has qualification name predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationName>')))
  end

end
