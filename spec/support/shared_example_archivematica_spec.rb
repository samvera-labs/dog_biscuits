# frozen_string_literal: true

shared_examples_for 'archivematica' do
  # metadata
  it 'has aip_uuid' do
    expect(stubby.aip_uuid).to eq('aip-uuid')
  end
  it 'has transfer_uuid' do
    expect(stubby.transfer_uuid).to eq('transfer-uuid')
  end
  it 'has sip_uuid' do
    expect(stubby.sip_uuid).to eq('sip-uuid')
  end
  it 'has dip_uuid' do
    expect(stubby.dip_uuid).to eq('dip-uuid')
  end
  it 'has aip_status' do
    expect(stubby.aip_status).to eq('aip-status')
  end
  it 'has dip_status' do
    expect(stubby.dip_status).to eq('dip-status')
  end
  it 'has aip_size' do
    expect(stubby.aip_size).to eq('aip-size')
  end
  it 'has dip_size' do
    expect(stubby.dip_size).to eq('dip-size')
  end
  it 'has aip_current_path' do
    expect(stubby.aip_current_path).to eq('aip-current-path')
  end
  it 'has dip_current_path' do
    expect(stubby.dip_current_path).to eq('dip-current-path')
  end
  it 'has aip_current_location' do
    expect(stubby.aip_current_location).to eq('aip-current-location')
  end
  it 'has dip_current_location' do
    expect(stubby.dip_current_location).to eq('dip-current-location')
  end
  it 'has aip_resource_uri' do
    expect(stubby.aip_resource_uri).to eq('aip-uri')
  end
  it 'has dip_resource_uri' do
    expect(stubby.dip_resource_uri).to eq('dip-uri')
  end
  it 'has origin_pipeline' do
    expect(stubby.origin_pipeline).to eq('origin-pipeline')
  end

  describe '#predicates' do
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipUuid'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipUuid'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#sipUuid'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#transferUuid'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentPath'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentPath'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentLocation'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentLocation'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#originPipeline'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipSize'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipSize'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipResourceUri'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipResourceUri'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipStatus'))) }
    specify { expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipStatus'))) }
  end

  it 'has an aip package type' do
    stubby.add_types
    expect(stubby.type.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage')))
  end

  it 'has dip package type' do
    stubby.add_types
    expect(stubby.type.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage')))
  end
end
