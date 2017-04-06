shared_examples_for 'archivematica' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym,) # :with_before_save_callback)
  end

  # metadata
  it 'has aip_uuid' do
    expect(@stubby.aip_uuid).to eq('aip-uuid')
  end
  it 'has transfer_uuid' do
    expect(@stubby.transfer_uuid).to eq('transfer-uuid')
  end
  it 'has sip_uuid' do
    expect(@stubby.sip_uuid).to eq('sip-uuid')
  end
  it 'has dip_uuid' do
    expect(@stubby.dip_uuid).to eq('dip-uuid')
  end
  it 'has aip_status' do
    expect(@stubby.aip_status).to eq('aip-status')
  end
  it 'has dip_status' do
    expect(@stubby.dip_status).to eq('dip-status')
  end
  it 'has aip_size' do
    expect(@stubby.aip_size).to eq('aip-size')
  end
  it 'has dip_size' do
    expect(@stubby.dip_size).to eq('dip-size')
  end
  it 'has aip_current_path' do
    expect(@stubby.aip_current_path).to eq('aip-current-path')
  end
  it 'has dip_current_path' do
    expect(@stubby.dip_current_path).to eq('dip-current-path')
  end
  it 'has aip_current_location' do
    expect(@stubby.aip_current_location).to eq('aip-current-location')
  end
  it 'has dip_current_location' do
    expect(@stubby.dip_current_location).to eq('dip-current-location')
  end
  it 'has aip_resource_uri' do
    expect(@stubby.aip_resource_uri).to eq('aip-uri')
  end
  it 'has dip_resource_uri' do
    expect(@stubby.dip_resource_uri).to eq('dip-uri')
  end
  it 'has origin_pipeline' do
    expect(@stubby.origin_pipeline).to eq('origin-pipeline')
  end

  # predicates
  it 'has predicates for all properties' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipUuid')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipUuid')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#sipUuid')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#transferUuid')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentPath')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentPath')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipCurrentLocation')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipCurrentLocation')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#originPipeline')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipSize')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipSize')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipResourceUri')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipResourceUri')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#aipStatus')))
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#dipStatus')))
  end

  it 'has an aip package type' do
    @stubby.add_types
    expect(@stubby.type.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage')))
  end

  it 'has dip package type' do
    @stubby.add_types
    expect(@stubby.type.should(include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage')))
  end
end
