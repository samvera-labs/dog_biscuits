shared_examples_for 'official_url' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have an official_url' do
    expect(@stubby.official_url).to eq(['http://www.london.ac.uk'])
  end
  it 'will have the ulcc_terms official_url predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://ulcc.ac.uk/ontologies/terms#officialUrl')))
  end
end

