# frozen_string_literal: true

shared_examples_for 'department' do
  let(:org) { FactoryBot.build_stubbed(:organisation) }

  before do
    stubby.department_resource << org
  end
  # metadata
  it 'has department' do
    expect(stubby.department_resource.first).to eq(org)
  end

  it 'has department predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['department_label_tesim'].should(eq([org.preflabel])))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:department)))
  end

  # TODO
  # it 'is in the configuration property_mappings' do
  #   expect(DogBiscuits.config.property_mappings[:department].should be_truthy)
  # end

  # TODO
  # it 'is in the properties' do
  #   expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:department_label))
  # end
end
