# frozen_string_literal: true

module DogBiscuits
  class PublishedWork < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << DogBiscuits::Vocab::UlccTerms.PublishedWork

    include DogBiscuits::AddPublishedWorkMetadata

    before_save :combine_dates

    def published_work?
      true
    end

    self.indexer = DogBiscuits::PublishedWorkIndexer

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
