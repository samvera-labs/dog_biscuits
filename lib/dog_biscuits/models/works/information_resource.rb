# frozen_string_literal: true

module DogBiscuits
  class InformationResource < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    # @todo find a predicate
    type << ::RDF::Vocab::DCMIType.Image

    # before_save :combine_dates

    def information_resource?
      true
    end

    # Create single date field from all dates.
    # def combine_dates
    #   tmpdate = date
    #   tmpdate << date_published
    #   tmpdate << date_available
    #   tmpdate << date_accepted
    #   tmpdate << date_submitted
    #   tmpdate << date_created
    #   self.date = tmpdate
    # end
  end
end
