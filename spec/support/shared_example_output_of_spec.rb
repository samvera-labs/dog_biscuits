# frozen_string_literal: true

shared_examples_for 'output_of' do
  let(:project) { FactoryBot.build_stubbed(:project) }

  before do
    stubby.output_of_resource << project
  end
  it 'has project' do
    expect(stubby.output_of_resource.first).to eq(project)
  end
  it 'has project predicate' do
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#outputOf')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('output_of_label_tesim')))
  end

  it 'has output_of' do
    expect(stubby.output_of).to eq(['some project'])
  end
  it 'has orcid predicate' do
    expect(rdf.should(include('http://purl.org/cerif/frapo/isOutputOf')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:output_of)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:output_of].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:abstract)))
  end
end
