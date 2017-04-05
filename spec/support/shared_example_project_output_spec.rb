shared_examples_for 'project_output' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @project = FactoryGirl.build_stubbed(:project)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.project_resource << @project
  end
  it 'has project' do
    expect(@stubby.project_resource.first).to eq(@project)
  end
  it 'has project predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#outputOf')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('project_value_tesim')))
    expect(@stubby.to_solr.should(include('project_value_sim')))
  end
end
