shared_examples_for 'publisher' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @publisher = FactoryGirl.build(:organisation)
    @stubby.publisher_resource << @publisher
  end
  it 'will have the metadata' do
    expect(@stubby.publisher).to eq(['Rough Trade Records'])
    expect(@stubby.publisher_resource.first).to eq(@publisher)
  end
  it 'will have the predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/publisher')))
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/pbl')))
  end
end
