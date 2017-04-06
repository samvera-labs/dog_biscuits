shared_examples_for 'identifier' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has identifier' do
    expect(@stubby.identifier).to eq(['identifier_test'])
  end
  it 'has identifier predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/identifier')))
  end
end
