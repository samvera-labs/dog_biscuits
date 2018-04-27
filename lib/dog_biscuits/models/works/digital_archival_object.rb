# frozen_string_literal: true

module DogBiscuits
  class DigitalArchivalObject < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # metadata
    # http://data.archiveshub.ac.uk/def/accessProvidedBy Organisation
    # These probably should be an Agent record
    #   http://data.archiveshub.ac.uk/def/countryCode
    #   http://data.archiveshub.ac.uk/def/maintenanceAgencyCode

    # partOf Accession
    #   accessionNumber (subProperty of dcterms:identifier)
    # partOf Collection object

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://data.archiveshub.ac.uk/def/ArchivalResource')

    # Indexer
    # self.indexer = DogBiscuits::DigitalArchivalObjectIndexer
    # Metadata
    # include DogBiscuits::DigitalArchivalObjectMetadata

    # before_save :combine_dates

    def digital_archival_object?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_available
      date << date_created
    end
  end
end
