shared_examples_for 'project_output' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @project = FactoryGirl.build_stubbed(:project)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.project_resource << @project
  end
  it 'will be in a project' do
    expect(@stubby.project_resource.first).to eq(@project)
  end
  it 'will have the project predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://ulcc.ac.uk/ontologies/terms#outputOf')))
  end
end

