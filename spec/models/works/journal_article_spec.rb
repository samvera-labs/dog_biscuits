require 'spec_helper'

describe DogBiscuits::JournalArticle do
  let(:journal) { FactoryGirl.build(:journal_article) }

  it 'is a journal article' do
    expect(journal).to be_journal_article
  end

  # Concerns
  it_behaves_like 'in_journal'
  it_behaves_like 'issue_number'
  it_behaves_like 'volume_number'
  it_behaves_like 'pagination'
  it_behaves_like 'available'
  it_behaves_like 'date_accepted'
  it_behaves_like 'date_submitted'
  it_behaves_like 'date_published'
  it_behaves_like 'official_url'
  it_behaves_like 'refereed'
  it_behaves_like 'publication_status'
  it_behaves_like 'funder'
  it_behaves_like 'project_output'
  it_behaves_like 'identifier'
  it_behaves_like 'related_url'
  it_behaves_like 'managing_organisation'

  describe '#rdftypes' do
    specify { journal.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { journal.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { journal.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { journal.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { journal.type.should include('http://purl.org/spar/fabio/JournalArticle') }
  end

  describe 'combine dates' do
    before do
      journal.combine_dates
    end
    specify { journal.date.should eq(%w(2016 2015 2013 2014)) }
  end

  describe '#predicates' do
    specify { journal.resource.dump(:ttl).should include('http://purl.org/dc/terms/date') }
  end

end
