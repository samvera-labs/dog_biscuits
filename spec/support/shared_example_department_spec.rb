shared_examples_for 'department' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @org = FactoryGirl.build_stubbed(:current_organisation)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.department_resource << @org

  end
  # metadata
  it 'will have a department' do
    expect(@stubby.department_resource.first).to eq(@org)
  end

  # predicates
  it 'will have uketd department' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end

end
