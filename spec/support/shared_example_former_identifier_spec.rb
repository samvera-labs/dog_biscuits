shared_examples_for 'former_identifier' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has former identifier' do
    expect(@stubby.former_id).to eq(['york:1234'])
  end
  it 'has former identifier predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#formerIdentifier')))
  end
end
