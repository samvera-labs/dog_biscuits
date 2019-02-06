# frozen_string_literal: true

module DogBiscuits
  class Image < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::Vocab::DCMIType.Image

    before_save :combine_dates

    def image?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      tmpdate = date
      tmpdate << date_created
      self.date = tmpdate
    end
  end
end
