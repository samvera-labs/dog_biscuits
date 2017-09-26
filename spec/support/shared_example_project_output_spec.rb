# frozen_string_literal: true

shared_examples_for 'project_output' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:project) { FactoryGirl.build_stubbed(:project) }

  before do
    stubby.project_resource << project
  end
  it 'has project' do
    expect(stubby.project_resource.first).to eq(project)
  end
  it 'has project predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#outputOf')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('project_label_tesim')))
  end
end
