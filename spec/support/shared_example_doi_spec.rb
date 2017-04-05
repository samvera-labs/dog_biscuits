shared_examples_for 'doi' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has doi' do
    expect(@stubby.doi).to eq(['xxx-xxx-xxx'])
  end
  it 'has doi predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/identifiers/doi')))
  end
end
