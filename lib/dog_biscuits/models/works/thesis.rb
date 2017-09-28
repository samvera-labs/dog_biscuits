# frozen_string_literal: true

module DogBiscuits
  class Thesis < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddThesisMetadata

    before_save :combine_dates

    type << ::RDF::Vocab::BIBO.Thesis

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
