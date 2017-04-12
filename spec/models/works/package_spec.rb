require 'spec_helper'

describe DogBiscuits::Package do
  let(:package) { FactoryGirl.build(:package) }

  it 'is a package' do
    expect(package).to be_package
  end

  it 'is not an aip' do
    package.aip_uuid = nil
    expect(package).to_not be_aip
  end

  it 'is not a dip' do
    package.dip_uuid = nil
    expect(package).to_not be_dip
  end

  describe '#rdftypes' do
    specify { package.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { package.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { package.type.should_not include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage') }
    specify { package.type.should_not include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage') }
    specify { package.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { package.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { package.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
  end

  it_behaves_like 'archivematica'
  it_behaves_like 'simple_versions'

  it 'is an aip' do
    expect(package).to be_aip
  end

  it 'is a dip' do
    expect(package).to be_dip
  end

  it 'has rdftypes for aip/dip' do
    package.add_types
    expect(package.type).to include('http://dlib.york.ac.uk/ontologies/oais-archivematica#DisseminationInformationPackage')
    expect(package.type).to include('http://dlib.york.ac.uk/ontologies/oais-archivematica#ArchivalInformationPackage')
  end

  describe '#predicates' do
    # none
  end

end
