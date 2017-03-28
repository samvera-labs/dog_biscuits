shared_examples_for 'foaf_name_parts' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    @model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(@model_str.underscore.to_sym)
  end
  it 'will have a family name' do
    expect(@stubby.family_name).to eq('Morrissey')
  end
  it 'will have the foaf.familyName predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/familyName')))
  end
  it 'will have a given name' do
    expect(@stubby.given_name).to eq('Stephen Patrick')
  end
  it 'will have the foaf.givenName predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/givenName')))
  end
  
end
