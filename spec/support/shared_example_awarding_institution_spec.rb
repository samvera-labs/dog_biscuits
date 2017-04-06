shared_examples_for 'awarding_institution' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @org = FactoryGirl.build_stubbed(:organisation)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.awarding_institution_resource << @org
  end

  it 'has awarding institution resource' do
    expect(@stubby.awarding_institution_resource.first).to eq(@org)
  end

  it 'has will have an awarding institution predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('awarding_institution_value_tesim')))
    expect(@stubby.to_solr.should(include('awarding_institution_value_sim')))
  end
end
