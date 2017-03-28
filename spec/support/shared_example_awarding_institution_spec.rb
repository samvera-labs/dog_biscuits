shared_examples_for 'awarding_institution' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @org = FactoryGirl.build_stubbed(:current_organisation)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.awarding_institution_resource << @org

  end
  # metadata
  it 'will have an awarding department' do
    expect(@stubby.awarding_institution_resource.first).to eq(@org)
  end

  # predicates
  it 'will have bibframe dissertationInstitution' do
    expect(@stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end

end
