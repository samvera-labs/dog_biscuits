require 'spec_helper'

describe DogBiscuits::Dataset do
  let(:dataset) { FactoryGirl.build(:dataset) }
  let(:package) { FactoryGirl.build_stubbed(:package) }
  let(:generic_work) { FactoryGirl.build(:generic_work) }
  let(:fs) { FactoryGirl.build_stubbed(:file_set) }
  let(:readme) { FactoryGirl.build_stubbed(:file_set) }
  let(:org) { FactoryGirl.build_stubbed(:organisation) }

  it 'is a dataset' do
    expect(dataset).to be_dataset
  end

  it_behaves_like 'pure'
  it_behaves_like 'for_indexing'
  it_behaves_like 'simple_versions'
  it_behaves_like 'doi'
  it_behaves_like 'access_rights'
  it_behaves_like 'publisher'
  it_behaves_like 'available'
  it_behaves_like 'creator'
  it_behaves_like 'readme_file'
  it_behaves_like 'last_access'
  it_behaves_like 'number_of_downloads'

  describe '#metadata' do
    specify { dataset.type.should include('http://www.w3.org/ns/dcat#Dataset') }
    specify { dataset.embargo_release.should eq(2016 - 12 - 12) }
    specify { dataset.retention_policy.should eq(['10 years from last access']) }
    specify { dataset.restriction_note.should eq(['restriction note']) }
    before do
      dataset.managing_organisation_resource << org
    end
    specify { dataset.managing_organisation_resource.first.should eq(org) }
  end

  describe '#predicates' do
    specify { dataset.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#embargoRelease') }
    specify { dataset.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#retentionPolicy') }
    specify { dataset.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#restrictionNote') }
  end

  describe '#related objects' do
    before(:each) do
      dataset.packaged_by << package
      dataset.members << fs
      dataset.members << readme
    end
    it 'has packaged by' do
      expect(dataset.packaged_by.size).to eq(1)
    end
    it 'has an aip' do
      expect(dataset.aips.size).to eq(1)
    end
    it 'has dip' do
      expect(dataset.dips.size).to eq(1)
    end
    it 'has two members' do
      expect(dataset.members.size).to eq(2)
    end
  end

  describe '#custom indexer' do
    it 'adds access_rights_tesi to the solr index ' do
      expect(dataset.to_solr).to include('dc_access_rights_tesi')
    end
  end
end
