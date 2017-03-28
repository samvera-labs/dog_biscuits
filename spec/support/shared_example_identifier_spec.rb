shared_examples_for 'identifier' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a identifier' do
    expect(@stubby.identifier).to eq(['identifier_test'])
  end
  it 'will have the dc.identifier predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/identifier')))
  end
end
