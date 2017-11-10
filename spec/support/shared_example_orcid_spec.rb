# frozen_string_literal: true

shared_examples_for 'orcid' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has orcid' do
    expect(stubby.orcid).to eq(['xxx-xxx-xxx'])
  end
  it 'has orcid predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/orcid')))
  end
end
