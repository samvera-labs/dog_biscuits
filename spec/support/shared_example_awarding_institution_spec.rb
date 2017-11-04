# frozen_string_literal: true

shared_examples_for 'awarding_institution' do
  let(:org) { FactoryGirl.build_stubbed(:organisation) }

  before do
    org.add_label
    stubby.awarding_institution_resource << org
  end

  it 'has awarding institution resource' do
    expect(stubby.awarding_institution_resource.first).to eq(org)
  end

  it 'has will have an awarding institution predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/grantingInstitution')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['awarding_institution_label_tesim'].should(eq([org.preflabel])))
  end

  # TODO: awarding_institution
  # it 'is in the solr_document' do
  #   expect(solr_doc.should respond_to(:awarding_institution))
  # end
  #
  # it 'is in the configuration property_mappings' do
  #   expect(DogBiscuits.config.property_mappings[:awarding_institution].should be_truthy)
  # end
  #
  # it 'is in the properties' do
  #   expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:awarding_institution))
  # end
end
