# frozen_string_literal: true

module DogBiscuits
  class Thesis < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << ::RDF::Vocab::BIBO.Thesis

    include DogBiscuits::AddThesisMetadata

    before_save :combine_dates

    self.indexer = DogBiscuits::ThesisIndexer

    def thesis?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_of_award
    end
  end
end
