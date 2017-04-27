# frozen_string_literal: true

module DogBiscuits
  class PublishedItem < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddPublishedItemMetadata

    before_save :combine_dates

    type << ::RDF::Vocab::BIBO.Document

    def published_item?
      true
    end

    class PublishedItemIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesPublishedItem
    end

    def self.indexer
      PublishedItemIndexer
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_published
      date << date_available
      date << date_accepted
      date << date_submitted
    end
  end
end
