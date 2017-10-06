# frozen_string_literal: true

shared_examples_for 'project_output' do
  let(:project) { FactoryGirl.build_stubbed(:project) }

  before do
    stubby.project_resource << project
  end
  it 'has project' do
    expect(stubby.project_resource.first).to eq(project)
  end
  it 'has project predicate' do
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#outputOf')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('project_label_tesim')))
  end

  # TODO: project
  # it 'is in the solr_document' do
  #   expect(solr_doc.should respond_to(:abstract))
  # end
  #
  # it 'is in the configuration property_mappings' do
  #   expect(DogBiscuits.config.property_mappings[:abstract].should be_truthy)
  # end
  #
  # it 'is in the properties' do
  #   expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:abstract))
  # end
end
