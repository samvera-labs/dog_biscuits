shared_examples_for 'number_of_downloads' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has number_of_downloads' do
    expect(@stubby.number_of_downloads).to eq('52')
  end
  it 'has number_of_downloads predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#numberOfDownloads')))
  end
end
