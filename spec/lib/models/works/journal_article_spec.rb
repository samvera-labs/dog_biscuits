# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::JournalArticle do
  let(:stubby) { FactoryBot.build(:journal_article) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:solr_doc) { SolrDocument.new(stubby.to_solr) }

  after do
    stubby.destroy
  end

  it 'is a journal article' do
    expect(stubby).to be_journal_article
  end

  # Concerns
  it_behaves_like 'date_available'
  it_behaves_like 'date_accepted'
  it_behaves_like 'date_submitted'
  it_behaves_like 'date_published'
  it_behaves_like 'funder'
  it_behaves_like 'identifier'
  it_behaves_like 'issue_number'
  it_behaves_like 'managing_organisation'
  it_behaves_like 'official_url'
  it_behaves_like 'pagination'
  it_behaves_like 'part_of'
  it_behaves_like 'output_of'
  it_behaves_like 'publication_status'
  it_behaves_like 'refereed'
  it_behaves_like 'volume_number'

  describe '#rdftypes' do
    specify { stubby.type.should_not include('http://purl.org/bib.schema.org/Thesis') }
    specify { stubby.type.should include('http://schema.org/ScholarlyArticle') }
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
