shared_examples_for 'date_submitted' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has date submitted' do
    expect(@stubby.date_submitted).to eq('2013')
  end
  it 'has date submitted predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#dateSubmitted')))
  end
end
