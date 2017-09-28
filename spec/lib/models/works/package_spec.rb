# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Package do
  let(:stubby) { FactoryGirl.build(:package) }

  after do
    stubby.destroy
  end

  it 'is a package' do
    expect(stubby).to be_package
  end

  it 'is not an aip' do
    stubby.aip_uuid = nil
    expect(stubby).not_to be_aip
  end

  it 'is not a dip' do
    stubby.dip_uuid = nil
    expect(stubby).not_to be_dip
  end

  describe '#rdftypes' do
    specify { stubby.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { stubby.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { stubby.type.should_not include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage') }
    specify { stubby.type.should_not include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage') }
    specify { stubby.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { stubby.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { stubby.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
  end

  it_behaves_like 'archivematica'
  it_behaves_like 'simple_versions'

  it 'is an aip' do
    expect(stubby).to be_aip
  end

  it 'is a dip' do
    expect(stubby).to be_dip
  end

  it 'has rdftypes for aip' do
    stubby.add_types
    expect(stubby.type).to include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage')
  end

  it 'has rdftypes for dip' do
    stubby.add_types
    expect(stubby.type).to include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage')
  end
end
