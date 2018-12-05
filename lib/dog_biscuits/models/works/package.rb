# frozen_string_literal: true

module DogBiscuits
  class Package < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << DogBiscuits::Vocab::Generic.Package

    # Local metadata
    has_and_belongs_to_many :packages,
                            class_name: 'DogBiscuits::Work',
                            predicate: DogBiscuits::Vocab::Generic.packages,
                            inverse_of: :packaged_by

    # Indexer
    # Metadata
    # include DogBiscuits::PackageMetadata

    before_save :add_types

    def package?
      true
    end

    # It's an AIP if it has an AIP UUID
    def aip?
      aip_uuid.blank? ? false : true
    end

    # It's a DIP if it has a DIP UUID
    def dip?
      dip_uuid.blank? ? false : true
    end

    # If object is a DIP/AIP, add the rdf type
    def add_types
      rdf_type << DogBiscuits::Vocab::OaisArchivematica.DisseminationInformationPackage if dip?
      rdf_type << DogBiscuits::Vocab::OaisArchivematica.ArchivalInformationPackage if aip?
    end
  end
end
