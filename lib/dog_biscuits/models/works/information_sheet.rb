# frozen_string_literal: true

module DogBiscuits
  class InformationSheet < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/InstructionalWork')

    before_save :combine_dates

    def infromation_resource?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      tmpdate = date
      tmpdate << release_date
      self.date = tmpdate
    end
  end
end
