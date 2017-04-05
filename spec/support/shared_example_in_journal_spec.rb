shared_examples_for 'in_journal' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
  end
  it 'will be in a journal' do
    expect(@stubby.journal).to eq(['The Journal of Woe'])
  end
  it 'has frbr:partOf predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('https://vocab.org/frbr/core#partOf')))
  end
end
