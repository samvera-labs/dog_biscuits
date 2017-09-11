# frozen_string_literal: true

module DogBiscuits
  class PublishedWork < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddPublishedWorkMetadata

    before_save :combine_dates

    # TODO: This is to broad; need a type that captures the idea of a single (or collected) published thing, that
    #   incoporates book, report, monograph etc.
    type << ::RDF::Vocab::BIBO.Document

    def published_work?
      true
    end

    class PublishedWorkIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesPublishedWork
    end

    def self.indexer
      PublishedWorkIndexer
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
