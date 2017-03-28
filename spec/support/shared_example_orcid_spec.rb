shared_examples_for 'orcid' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a orcid' do
    expect(@stubby.orcid).to eq(['xxx-xxx-xxx'])
  end
  it 'will have the orcid predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/identifiers/orcid')))
  end
end
