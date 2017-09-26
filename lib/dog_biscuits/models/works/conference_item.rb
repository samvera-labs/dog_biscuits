# frozen_string_literal: true

module DogBiscuits
  class ConferenceItem < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddConferenceItemMetadata

    before_save :combine_dates

    type << DogBiscuits::Vocab::UlccTerms.ConferenceItem

    def conference_item?
      true
    end

    def self.indexer
      DogBiscuits::ConferenceItemIndexer
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
