# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::PublishedItem do
  let(:published_item) {FactoryGirl.build(:published_item)}

  it 'is a published item' do
    expect(published_item).to be_published_item
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
    specify {published_item.type.should_not include('http://www.w3.org/ns/dcat#Dataset')}
    specify {published_item.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package')}
    specify {published_item.type.should_not include('http://purl.org/ontology/bibo/Thesis')}
    specify {published_item.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper')}
    specify {published_item.type.should_not include('http://purl.org/spar/fabio/JournalArticle')}
    specify {published_item.type.should include('http://purl.org/ontology/bibo/Document')}
  end

  describe 'combine dates' do
    before do
      published_item.combine_dates
    end
    specify {published_item.date.should eq(%w[2016 2015 2013 2014])}
  end

  describe '#predicates' do
    specify {published_item.resource.dump(:ttl).should include('http://purl.org/dc/terms/date')}
  end
end