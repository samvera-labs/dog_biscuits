# frozen_string_literal: true

shared_examples_for 'hub_dates' do
  it 'has dates' do
    expect(stubby.dates).to eq('1500-1550')
  end
  it 'has dates predicate' do
    expect(rdf.should(include('http://data.archiveshub.ac.uk/def/dates')))
  end
end
