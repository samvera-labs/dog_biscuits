shared_examples_for 'in_journal' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @journal = FactoryGirl.build_stubbed(:journal)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.journal_resource << @journal
  end
  it 'will be in a journal' do
    expect(@stubby.journal_resource.first).to eq(@journal)
  end
  it 'has frbr:partOf predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('https://vocab.org/frbr/core#partOf')))
  end
end

