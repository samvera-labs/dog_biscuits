shared_examples_for 'abstract' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end

  it 'has abstract' do
    expect(@stubby.abstract).to eq(['abstract'])
  end

  it 'has abstract predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/abstract')))
  end
end
