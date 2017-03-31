shared_examples_for 'mads_related_authority' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has related authority' do
    expect(@stubby.related_authority).to eq(['related authority'])
  end
  it 'has related authority predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.loc.gov/mads/rdf/v1#hasRelatedAuthority')))
  end
end
