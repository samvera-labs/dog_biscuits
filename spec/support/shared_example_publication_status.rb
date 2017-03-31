shared_examples_for 'publication_status' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has publication_status' do
    expect(@stubby.publication_status).to eq('Published')
  end
  it 'has status predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/ontology/bibo/status')))
  end
end

