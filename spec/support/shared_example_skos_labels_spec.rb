shared_examples_for 'skos_labels' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has a preflabel' do
    expect(@stubby.preflabel).to eq('label')
  end
  it 'has an altlabel' do
    expect(@stubby.altlabel).to eq(['alternative label'])
  end
  it 'has skos altLabel predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#altLabel')))
  end
  it 'has skos prefLabel predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
  end
end
