# frozen_string_literal: true

shared_examples_for 'funder' do
  let(:funder) { FactoryBot.build_stubbed(:organisation) }

  before do
    stubby.funder_resource << funder
  end
  it 'has funder' do
    expect(stubby.funder_resource.first).to eq(funder)
  end
  it 'has funder predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/fnd')))
  end

  # TODO: funder

  # it 'has contributor in solr' do
  #   expect(stubby.to_solr['contributor_combined_tesim'].should(include(funder.preflabel)))
  #   expect(stubby.to_solr['contributor_type_sim'].should(include('editor')))
  # end
  # it 'is in the solr_document' do
  #   expect(solr_doc.should respond_to(:funder))
  # end
  #
  # it 'is in the configuration property_mappings' do
  #   expect(DogBiscuits.config.property_mappings[:funder].should be_truthy)
  # end
  #
  # it 'is in the properties' do
  #   expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:funder))
  # end
end
