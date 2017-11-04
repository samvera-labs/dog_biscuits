# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::PublishedWork do
  let(:stubby) { FactoryGirl.build(:published_work) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a published item' do
    expect(stubby).to be_published_work
  end

  # Concerns
  it_behaves_like 'available'
  it_behaves_like 'date_accepted'
  it_behaves_like 'date_submitted'
  it_behaves_like 'date_published'
  it_behaves_like 'edition'
  it_behaves_like 'editor'
  it_behaves_like 'isbn'
  it_behaves_like 'issue_number'
  it_behaves_like 'official_url'
  it_behaves_like 'pagination'
  it_behaves_like 'part'
  it_behaves_like 'place_of_publication'
  it_behaves_like 'publication_status'
  it_behaves_like 'refereed'
  it_behaves_like 'series'
  it_behaves_like 'volume_number'

  describe '#rdftypes' do
    specify { stubby.type.should include('http://london.ac.uk/ontologies/terms#PublishedWork') }
    specify { stubby.type.should include('http://schema.org/Book') }
    specify { stubby.type.should_not include('https://bib.schema.org/Thesis') }
  end

  describe 'combine dates' do
    before do
      stubby.combine_dates
    end
    specify { stubby.date.should eq(%w[2016 2015 2013 2014]) }
  end

  describe '#predicates' do
    specify { rdf.should include('http://purl.org/dc/terms/date') }
  end
end
