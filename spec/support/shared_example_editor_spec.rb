# frozen_string_literal: true

shared_examples_for 'editor' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:person) { FactoryGirl.build_stubbed(:person) }

  before do
    stubby.editor_resource << person
  end

  it 'has editor string and resource' do
    expect(stubby.editor).to eq(['Stephen Street'])
  end

  it 'has editor resource' do
    expect(stubby.editor_resource.first).to eq(person)
  end

  it 'has editor resource predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/edc')))
  end
  it 'has editor predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/ontology/bibo/editor')))
  end

  it 'has _value in solr' do
    expect(stubby.to_solr.should(include('editor_value_tesim')))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr.should(include('contributor_value_tesim')))
  end
end
