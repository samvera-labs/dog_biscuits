# frozen_string_literal: true

shared_examples_for 'contributor' do
  let(:contributor) { FactoryGirl.build_stubbed(:person) }

  before do
    stubby.contributor_resource << contributor
  end
  it 'has contributor' do
    expect(stubby.contributor).to eq(['Joyce, Mike'])
  end
  it 'has contributor resource' do
    expect(stubby.contributor_resource.first).to eq(contributor)
  end
  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/contributor')))
  end
  it 'has resource predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/ctb')))
  end

  # Don't test for _label in solr - no models use this at the moment

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:contributor)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:contributor].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:contributor)))
  end
end
