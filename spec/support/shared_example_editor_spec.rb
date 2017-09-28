# frozen_string_literal: true

shared_examples_for 'editor' do
  let(:person) { FactoryGirl.build_stubbed(:person) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
    expect(stubby.to_solr['contributor_label_tesim'].should(include('Street, Stephen', person.preflabel)))
  end
end
