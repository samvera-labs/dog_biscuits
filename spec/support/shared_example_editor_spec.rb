# frozen_string_literal: true

shared_examples_for 'editor' do
  let(:person) { FactoryBot.build_stubbed(:person) }
  before do
    person.add_label
    stubby.editor_resource << person
  end

  it 'has editor string' do
    expect(stubby.editor).to eq(['Street, Stephen'])
  end

  it 'has editor resource' do
    expect(stubby.editor_resource.first).to eq(person)
  end

  it 'has editor resource predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/edc')))
  end
  it 'has editor predicate' do
    expect(rdf.should(include('http://purl.org/ontology/bibo/editor')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['editor_label_tesim'].should(include('Street, Stephen', person.preflabel)))
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

  # TODO: label
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:editor)))
  end
end
