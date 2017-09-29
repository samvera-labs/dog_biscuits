# frozen_string_literal: true

module DogBiscuits
  class ConferenceItem < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << DogBiscuits::Vocab::UlccTerms.ConferenceItem
    # Included metadata
    include DogBiscuits::AddConferenceItemMetadata

    before_save :combine_dates

    self.indexer = DogBiscuits::ConferenceItemIndexer

    def conference_item?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_published
      date << date_available
      date << date_accepted
      date << date_submitted
      date << origin_date
    end
  end
end
