# frozen_string_literal: true

module DogBiscuits
  class PublishedWork < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << DogBiscuits::Vocab::UlccTerms.PublishedWork

    # Indexer
    # self.indexer = DogBiscuits::PublishedWorkIndexer
    # Metadata
    # include DogBiscuits::PublishedWorkMetadata

    before_save :combine_dates

    def published_work?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_published
      date << date_available
      date << date_accepted
      date << date_submitted
      date << date_created
    end
  end
end
