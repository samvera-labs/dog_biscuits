shared_examples_for 'advisor' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @person = FactoryGirl.build_stubbed(:person)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.advisor_resource << @person
  end

  it 'has advisor string and resource' do
    expect(@stubby.advisor).to eq(['Rourke, Andy'])
    expect(@stubby.advisor_resource.first).to eq(@person)
  end

  it 'has advisor predicates' do
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/ths')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#advisor')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('advisor_value_tesim')))
    expect(@stubby.to_solr.should(include('advisor_value_sim')))
  end

  # additional indexing of fields in solr
  it 'has contributor in solr' do
    expect(@stubby.to_solr.should(include('contributor_tesim')))
    expect(@stubby.to_solr.should(include('contributor_sim')))
  end
end
