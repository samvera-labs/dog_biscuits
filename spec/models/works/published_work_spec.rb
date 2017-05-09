# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::PublishedWork do
  let(:published_work) { FactoryGirl.build(:published_work) }

  it 'is a published item' do
    expect(published_work).to be_published_work
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
    specify { published_work.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { published_work.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { published_work.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { published_work.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { published_work.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
    specify { published_work.type.should include('http://purl.org/ontology/bibo/Document') }
  end

  describe 'combine dates' do
    before do
      published_work.combine_dates
    end
    specify { published_work.date.should eq(%w[2016 2015 2013 2014]) }
  end

  describe '#predicates' do
    specify { published_work.resource.dump(:ttl).should include('http://purl.org/dc/terms/date') }
  end
end
