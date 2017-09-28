# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::JournalArticle do
  let(:stubby) { FactoryGirl.build(:journal_article) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  after do
    stubby.destroy
  end

  it 'is a journal article' do
    expect(stubby).to be_journal_article
  end

  # Concerns
  it_behaves_like 'available'
  it_behaves_like 'date_accepted'
  it_behaves_like 'date_submitted'
  it_behaves_like 'date_published'
  it_behaves_like 'funder'
  it_behaves_like 'identifier'
  it_behaves_like 'in_journal'
  it_behaves_like 'issue_number'
  it_behaves_like 'managing_organisation'
  it_behaves_like 'official_url'
  it_behaves_like 'pagination'
  it_behaves_like 'project_output'
  it_behaves_like 'publication_status'
  it_behaves_like 'refereed'
  it_behaves_like 'related_url'
  it_behaves_like 'volume_number'

  describe '#rdftypes' do
    specify { stubby.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { stubby.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { stubby.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { stubby.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { stubby.type.should include('http://purl.org/spar/fabio/JournalArticle') }
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
