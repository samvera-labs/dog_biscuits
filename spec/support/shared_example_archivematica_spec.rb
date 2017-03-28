shared_examples_for 'archivematica' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym, :with_before_save_callback)
  end
  it 'has an aip_uuid' do
    expect(@stubby.aip_uuid).to eq('aip-uuid')
  end
  it 'has a transfer_uuid' do
    expect(@stubby.transfer_uuid).to eq('transfer-uuid')
  end
  it 'has a sip_uuid' do
    expect(@stubby.sip_uuid).to eq('sip-uuid')
  end
  it 'has a dip_uuid' do
    expect(@stubby.dip_uuid).to eq('dip-uuid')
  end
  it 'has a aip_status' do
    expect(@stubby.aip_status).to eq('aip-status')
  end
  it 'has a dip_status' do
    expect(@stubby.dip_status).to eq('dip-status')
  end
  it 'has a aip_size' do
    expect(@stubby.aip_size).to eq('aip-size')
  end
  it 'has a dip_size' do
    expect(@stubby.dip_size).to eq('dip-size')
  end
  it 'has a aip_current_path' do
    expect(@stubby.aip_current_path).to eq('aip-current-path')
  end
  it 'has a dip_current_path' do
    expect(@stubby.dip_current_path).to eq('dip-current-path')
  end
  it 'has a aip_current_location' do
    expect(@stubby.aip_current_location).to eq('aip-current-location')
  end
  it 'has a dip_current_location' do
    expect(@stubby.dip_current_location).to eq('dip-current-location')
  end
  it 'has a aip_resource_uri' do
    expect(@stubby.aip_resource_uri).to eq('aip-uri')
  end
  it 'has a dip_resource_uri' do
    expect(@stubby.dip_resource_uri).to eq('dip-uri')
  end
  it 'has a origin_pipeline' do
    expect(@stubby.origin_pipeline).to eq('origin-pipeline')
  end

  it 'will have predicate aipUuid' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipUuid')))
  end
  it 'will have predicate dipUuid' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipUuid')))
  end
  it 'will have predicate sipUuid' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#sipUuid')))
  end
  it 'will have predicate transferUuid' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#transferUuid')))
  end
  it 'will have predicate aipCurrentPath' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentPath')))
  end
  it 'will have predicate dipCurrentPath' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentPath')))
  end
  it 'will have predicate dipCurrentLocation' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentLocation')))
  end
  it 'will have predicate aipCurrentLocation' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentLocation')))
  end
  it 'will have predicate originPipeline' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#originPipeline')))
  end
  it 'will have predicate aipSize' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipSize')))
  end
  it 'will have predicate dipSize' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipSize')))
  end
  it 'will have predicate aipResourceUri' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipResourceUri')))
  end
  it 'will have predicate dipResourceUri' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipResourceUri')))
  end
  it 'will have predicate aipStatus' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipStatus')))
  end
  it 'will have predicate dipStatus' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipStatus')))
  end

  it 'should have aip package type' do
    @stubby.add_types
    expect(@stubby.type.should include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage'))
  end

  it 'should have dip package type' do
    @stubby.add_types
    expect(@stubby.type.should include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage'))
  end
end
