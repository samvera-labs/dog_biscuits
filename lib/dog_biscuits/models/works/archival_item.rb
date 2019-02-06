# frozen_string_literal: true

module DogBiscuits
  class ArchivalItem < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://data.archiveshub.ac.uk/def/ArchivalResource')

    has_and_belongs_to_many :has_dao,
                            class_name: 'DogBiscuits::DigitalArchivalItem',
                            predicate: DogBiscuits::Vocab::Generic.hasDao,
                            inverse_of: :in_archival_item

    # before_save :combine_dates

    def archival_item?
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
