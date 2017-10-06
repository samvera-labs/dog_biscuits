# frozen_string_literal: true

module DogBiscuits
  class Thesis < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::Vocab::BIBO.Thesis

    ## Indexer
    # self.indexer = DogBiscuits::ThesisIndexer
    # Metadata
    # include DogBiscuits::ThesisMetadata

    before_save :combine_dates

    def thesis?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_of_award
      date << date_created
    end
  end
end
