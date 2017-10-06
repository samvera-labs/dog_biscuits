# frozen_string_literal: true

shared_examples_for 'managing_organisation' do
  let(:org) { FactoryGirl.build(:organisation) }

  before do
    stubby.managing_organisation_resource << org
  end
  it 'has managing organisation' do
    expect(stubby.managing_organisation_resource.first).to eq(org)
  end
  it 'has managing organisation predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/pure#pureManagingUnit')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['managing_organisation_label_tesim'].should(eq([org.preflabel])))
  end

  # TODO: managing_organisation
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
