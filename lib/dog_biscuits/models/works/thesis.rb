# frozen_string_literal: true

module DogBiscuits
  class Thesis < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.intern('https://bib.schema.org/Thesis')

    ## Indexer
    # self.indexer = DogBiscuits::ThesisIndexer
    # Metadata
    # include DogBiscuits::ThesisMetadata

    # before_save :combine_dates

    def thesis?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      tmpdate = date
      tmpdate << date_of_award
      tmpdate << date_created
      self.date = tmpdate
    end
  end
end
