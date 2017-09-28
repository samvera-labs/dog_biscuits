# frozen_string_literal: true

shared_examples_for 'access_rights' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has access rights' do
    expect(stubby.dc_access_rights).to eq(['access rights'])
  end

  it 'has access rights predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/accessRights')))
  end
end
