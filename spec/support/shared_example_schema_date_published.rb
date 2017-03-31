shared_examples_for 'date_published' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has date_published' do
    expect(@stubby.date_published).to eq('2016')
  end
  it 'has date published predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/datePublished')))
  end
end

