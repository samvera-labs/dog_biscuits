# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Book do
  let(:book) { FactoryGirl.build(:book) }

  it 'is a published item' do
    expect(book).to be_book
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
    specify { book.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { book.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { book.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { book.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { book.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
    specify { book.type.should_not include('http://purl.org/ontology/bibo/Document') }
    specify { book.type.should include('http://purl.org/ontology/bibo/Book') }
  end

  describe 'combine dates' do
    before do
      book.combine_dates
    end
    specify { book.date.should eq(%w[2016 2015 2013 2014]) }
  end

  describe '#predicates' do
    specify { book.resource.dump(:ttl).should include('http://purl.org/dc/terms/date') }
  end
end
