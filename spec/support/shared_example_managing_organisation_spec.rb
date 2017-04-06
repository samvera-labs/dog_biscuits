shared_examples_for 'managing_organisation' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @org = FactoryGirl.build(:organisation)
    @stubby.managing_organisation_resource << @org
  end
  it 'has managing organisation' do
    expect(@stubby.managing_organisation_resource.first).to eq(@org)
  end
  it 'has managing organisation predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureManagingUnit')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('managing_organisation_value_tesim')))
    expect(@stubby.to_solr.should(include('managing_organisation_value_sim')))
  end
end
