shared_examples_for 'description' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has description' do
    expect(@stubby.description).to eq(['description'])
  end
  it 'has description predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/description')))
  end
end
