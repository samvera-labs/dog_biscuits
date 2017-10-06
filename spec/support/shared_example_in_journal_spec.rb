# frozen_string_literal: true

shared_examples_for 'in_journal' do
  it 'will be in a journal' do
    expect(stubby.journal).to eq(['The Journal of Woe'])
  end
  it 'has frbr:partOf predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end

  # TODO: journal
  # it 'is in the solr_document' do
  #   expect(solr_doc.should respond_to(:journal))
  # end
  #
  # it 'is in the configuration property_mappings' do
  #   expect(DogBiscuits.config.property_mappings[:journal].should be_truthy)
  # end
  #
  # it 'is in the properties' do
  #   expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:journal))
  # end
end
