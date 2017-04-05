shared_examples_for 'funder' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @funder = FactoryGirl.build_stubbed(:organisation)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.funder_resource << @funder
  end
  it 'has funder' do
    expect(@stubby.funder_resource.first).to eq(@funder)
  end
  it 'has funder predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/fnd')))
  end
end
