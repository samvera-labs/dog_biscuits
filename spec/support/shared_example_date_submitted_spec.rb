shared_examples_for 'date_submitted' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have submitted' do
    expect(@stubby.date_submitted).to eq('2013')
  end
  it 'will have the date submitted predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://ulcc.ac.uk/ontologies/terms#dateSubmitted')))
  end
end
