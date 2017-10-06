# frozen_string_literal: true

require 'spec_helper'

describe Dataset do
  let(:stubby) { FactoryGirl.build(:dataset) }
  let(:package) { FactoryGirl.build_stubbed(:package) }
  let(:generic_work) { FactoryGirl.build(:generic_work) }
  let(:fs) { FactoryGirl.build_stubbed(:file_set) }
  let(:readme) { FactoryGirl.build_stubbed(:file_set) }
  let(:org) { FactoryGirl.build_stubbed(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a dataset' do
    expect(stubby).to be_dataset
  end

  it_behaves_like 'access_rights'
  it_behaves_like 'available'
  it_behaves_like 'creator'
  it_behaves_like 'doi'
  it_behaves_like 'for_indexing'
  it_behaves_like 'has_restriction'
  it_behaves_like 'last_access'
  it_behaves_like 'number_of_downloads'
  it_behaves_like 'pure'
  it_behaves_like 'readme_file'
  it_behaves_like 'resource_type'
  it_behaves_like 'simple_versions'

  describe '#metadata' do
    before do
      stubby.managing_organisation_resource << org
    end
    specify { stubby.managing_organisation_resource.first.should eq(org) }
  end

  describe '#rdftypes' do
    specify { stubby.type.should include('http://www.w3.org/ns/dcat#Dataset') }
    specify { stubby.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
  end

  describe '#related objects' do
    before do
      stubby.packaged_by << package
      stubby.members << fs
      stubby.members << readme
    end
    it 'has packaged by' do
      expect(stubby.packaged_by.size).to eq(1)
    end
    it 'has an aip' do
      expect(stubby.aips.size).to eq(1)
    end
    it 'has dip' do
      expect(stubby.dips.size).to eq(1)
    end
    it 'has two members' do
      expect(stubby.members.size).to eq(2)
    end
  end

  describe '#custom indexer' do
    it 'adds access_rights_tesi to the solr index ' do
      expect(stubby.to_solr).to include('dc_access_rights_tesi')
    end
  end
end

# rubocop:enable Metrics/BlockLength
