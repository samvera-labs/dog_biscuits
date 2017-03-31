shared_examples_for 'hub_dates' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has dates' do
    expect(@stubby.dates).to eq('1500-1550')
  end
  it 'has dates predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://data.archiveshub.ac.uk/def/dates')))
  end
end
