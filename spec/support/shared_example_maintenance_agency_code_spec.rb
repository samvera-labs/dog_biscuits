# frozen_string_literal: true

shared_examples_for 'maintenance_agency_code' do
  it 'has maintenance_agency_code' do
    expect(stubby.maintenance_agency_code).to eq(['193'])
  end
  it 'has country_code predicate' do
    expect(rdf.should(include('http://data.archiveshub.ac.uk/def/maintenanceAgencyCode')))
  end
end
