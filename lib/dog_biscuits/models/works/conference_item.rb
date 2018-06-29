# frozen_string_literal: true

module DogBiscuits
  class ConferenceItem < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << DogBiscuits::Vocab::UlccTerms.ConferenceItem

    # Indexer
    # self.indexer = DogBiscuits::ConferenceItemIndexer
    # Metadata
    # include DogBiscuits::ConferenceItemMetadata

    # before_save :combine_dates

    def conference_item?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      tmpdate = date
      tmpdate << date_published
      tmpdate << date_available
      tmpdate << date_accepted
      tmpdate << date_submitted
      tmpdate << date_created
      date = tmpdate
    end
  end
end
