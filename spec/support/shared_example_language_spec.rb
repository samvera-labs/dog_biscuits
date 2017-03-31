shared_examples_for 'language' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has language' do
    expect(@stubby.language).to eq(['English'])
  end
  it 'has language predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/language')))
  end

  it 'has language code' do
    expect(@stubby.language_code).to eq(['en-GB'])
  end
  it 'has language code predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/language')))
  end
end
