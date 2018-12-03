# frozen_string_literal: true

shared_examples_for 'editor' do
  it 'has editor string' do
    expect(stubby.editor).to eq(['Street, Stephen'])
  end

  it 'has editor predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/edc')))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr['contributor_combined_tesim'].should(include('Street, Stephen', person.preflabel)))
    expect(stubby.to_solr['contributor_type_sim'].should(include('editor')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:editor)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:editor].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:editor)))
  end
end
