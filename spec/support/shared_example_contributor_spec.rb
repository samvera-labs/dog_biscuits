# frozen_string_literal: true

shared_examples_for 'contributor' do
  # the class that includes the concern

  let(:contributor) { FactoryGirl.build_stubbed(:person) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
end
