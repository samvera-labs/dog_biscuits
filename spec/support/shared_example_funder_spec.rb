# frozen_string_literal: true

shared_examples_for 'funder' do
  # the class that includes the concern

  let(:funder) { FactoryGirl.build_stubbed(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  before do
    stubby.funder_resource << funder
  end
  it 'has funder' do
    expect(stubby.funder_resource.first).to eq(funder)
  end
  it 'has funder predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/fnd')))
  end
end
