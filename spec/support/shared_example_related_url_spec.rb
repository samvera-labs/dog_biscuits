shared_examples_for 'related_url' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
  end

  it 'has related url' do
    expect(@stubby.related_url).to eq(['http://www.ulcc.ac.uk'])
  end

  it 'has see also predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.w3.org/2000/01/rdf-schema#seeAlso')))
  end
end
