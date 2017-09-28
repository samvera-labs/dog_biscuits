# frozen_string_literal: true

shared_examples_for 'has_restriction' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has restriction' do
    expect(stubby.has_restriction).to eq(['10 years from last access'])
  end
  it 'has restriction predicate' do
    expect(rdf.should(include('http://www.loc.gov/premis/rdf/v1#hasRestriction')))
  end
end
