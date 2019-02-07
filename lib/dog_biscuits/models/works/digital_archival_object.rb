# frozen_string_literal: true

module DogBiscuits
  class DigitalArchivalObject < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # partOf Accession
    #   accessionNumber (subProperty of dcterms:identifier)
    # partOf Collection object

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://data.archiveshub.ac.uk/def/ArchivalResource')
    
    has_and_belongs_to_many :in_archival_resource,
                            class_name: 'DogBiscuits::ArchivalResource',
                            predicate: DogBiscuits::Vocab::Generic.inArchivalResource,
                            inverse_of: :has_dao

    # Indexer
    # self.indexer = DogBiscuits::DigitalArchivalObjectIndexer
    # Metadata
    # include DogBiscuits::DigitalArchivalObjectMetadata

    def digital_archival_object?
      true
    end
  end
end
