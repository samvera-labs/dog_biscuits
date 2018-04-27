# frozen_string_literal: true

shared_examples_for 'country_code' do
  it 'has country_code' do
    expect(stubby.country_code).to eq(['GB'])
  end
  it 'has country_code predicate' do
    expect(rdf.should(include('http://www.geonames.org/ontology#countryCode')))
  end
end
