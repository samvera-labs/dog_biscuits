shared_examples_for 'borthwick_note' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has note' do
    expect(@stubby.note).to eq(['note'])
  end
  it 'has the note predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/borthwick-registers#note')))
  end
end
