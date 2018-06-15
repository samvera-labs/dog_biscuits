# frozen_string_literal: true

require 'spec_helper'

describe Package do
  let(:stubby) { FactoryBot.build(:package) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a package' do
    expect(stubby).to be_package
  end

  context 'is an aip/dip' do
    before do
      stubby.aip_uuid = nil
      stubby.dip_uuid = nil
    end

    it 'is not an aip' do
      expect(stubby).not_to be_aip
    end

    it 'is not a dip' do
      expect(stubby).not_to be_dip
    end

    after do
      stubby.aip_uuid = ['aip-uuid']
      stubby.dip_uuid = ['dip-uuid']
    end
  end

  describe '#rdftypes' do
    specify { stubby.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') } ##
    specify { stubby.type.should_not include('https://bib.schema.org/Thesis') }
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

# rubocop:enable Metrics/BlockLength
