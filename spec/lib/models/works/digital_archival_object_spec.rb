# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::DigitalArchivalObject do
  let(:stubby) { FactoryBot.build(:digital_archival_object) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a digital_archival_object' do
    expect(stubby).to be_digital_archival_object
  end

  # Concerns
  it_behaves_like 'access_provided_by'
  it_behaves_like 'part_of'

  describe '#rdftypes' do
    specify { stubby.type.should include('http://data.archiveshub.ac.uk/def/ArchivalResource') }
    specify { stubby.type.should_not include('https://bib.schema.org/Thesis') }
  end
end
