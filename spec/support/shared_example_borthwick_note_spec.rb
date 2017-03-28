shared_examples_for 'borthwick_note' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a note' do
    expect(@stubby.note).to eq(['note'])
  end
  it 'will have the foaf.name predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/borthwick-registers#note')))
  end
end
