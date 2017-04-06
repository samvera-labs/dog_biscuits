shared_examples_for 'content_version' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has content_version' do
    expect(@stubby.content_version).to eq(['AM'])
  end
  it 'has content_version predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/version')))
  end
end
