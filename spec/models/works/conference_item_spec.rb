# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ConferenceItem do
  let(:conference_item) { FactoryGirl.build(:conference_item) }

  it 'is a conference item' do
    expect(conference_item).to be_conference_item
  end

  # Concerns
  it_behaves_like 'available'
  it_behaves_like 'date_accepted'
  it_behaves_like 'date_submitted'
  it_behaves_like 'date_published'
  it_behaves_like 'editor'
  it_behaves_like 'isbn'
  it_behaves_like 'official_url'
  it_behaves_like 'origin_date'
  it_behaves_like 'pagination'
  it_behaves_like 'place_of_publication'
  it_behaves_like 'presented_at'
  it_behaves_like 'proceeding'
  it_behaves_like 'publication_status'
  it_behaves_like 'refereed'

  describe '#rdftypes' do
    specify { conference_item.type.should_not include('http://www.w3.org/ns/dcat#Dataset') }
    specify { conference_item.type.should_not include('http://dlib.york.ac.uk/ontologies/generic#Package') }
    specify { conference_item.type.should_not include('http://purl.org/ontology/bibo/Thesis') }
    specify { conference_item.type.should_not include('http://purl.org/spar/fabio/ExaminationPaper') }
    specify { conference_item.type.should_not include('http://purl.org/spar/fabio/JournalArticle') }
    specify { conference_item.type.should_not include('http://purl.org/ontology/bibo/Document') }
    specify { conference_item.type.should_not include('http://purl.org/ontology/bibo/Book') }
    specify { conference_item.type.should include('http://london.ac.uk/ontologies/terms#ConferenceItem') }
  end

  describe 'combine dates' do
    before do
      conference_item.combine_dates
    end
    specify { conference_item.date.should eq(%w[2016 2015 2013 2014 2012]) }
  end

  describe '#predicates' do
    specify { conference_item.resource.dump(:ttl).should include('http://purl.org/dc/terms/date') }
  end
end
