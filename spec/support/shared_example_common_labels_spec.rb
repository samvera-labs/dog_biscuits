shared_examples_for 'common_labels' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
  end
  it 'has a preflabel (authorities) or a title (works etc.)' do
    if @stubby.authority?
      expect(@stubby.preflabel).to eq('label')
    else
      expect(@stubby.title).to eq(['The Importance of Being Unhappy'])
    end
  end
  it 'will have the dc title or preflabel predicate' do
    if @stubby.authority?
      expect(@stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
    else
      expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/title')))
    end

  end
end
