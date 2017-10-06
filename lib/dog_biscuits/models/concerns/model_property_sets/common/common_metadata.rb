# frozen_string_literal: true

module DogBiscuits
  # Common metadata for all collections and works.
  # TODO align with BasicMetadata
  module CommonMetadata
    extend ActiveSupport::Concern

    # BasicMetadata: Omitting label, relative_url and import_url - are these fileset only?

    # Other Common concerns
    include DogBiscuits::CommonLabels
    include DogBiscuits::CommonRights # BasicMetadata

    # Common dc properties
    # dc:title is included in Core Metadata
    include DogBiscuits::BibliographicCitation # BasicMetadata
    include DogBiscuits::Creator # BasicMetadata
    include DogBiscuits::Contributor # BasicMetadata
    include DogBiscuits::Date
    include DogBiscuits::DateCreated # BasicMetadata
    include DogBiscuits::Department
    include DogBiscuits::Description # BasicMetadata
    include DogBiscuits::Funder
    include DogBiscuits::Identifier # BasicMetadata
    include DogBiscuits::Keyword # BasicMetadata (schema:keywords)
    include DogBiscuits::Language # BasicMetadata
    include DogBiscuits::Publisher # BasicMetadata
    include DogBiscuits::ResourceType # BasicMetadata
    include DogBiscuits::Source # BasicMetadata
    include DogBiscuits::Subject # BasicMetadata

    # Common other properties
    include DogBiscuits::Doi
    include DogBiscuits::ManagingOrganisation
    include DogBiscuits::RelatedUrl # BasicMetadata
    include DogBiscuits::SkosNote
    include DogBiscuits::RelatedUrl # BasicMetadata

    # Common dlib properties
    include DogBiscuits::FormerIdentifier

    # Controlled properties - must go at the end
    include DogBiscuits::BasedNear # BasicMetadata

    included do
      # From BasicMetadata, error on package TODO: fix this properly
      property :import_url, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#importUrl'), multiple: false
      id_blank = proc { |attributes| attributes[:id].blank? }
      class_attribute :controlled_properties
      self.controlled_properties = [:based_near]
      accepts_nested_attributes_for :based_near, reject_if: id_blank, allow_destroy: true
    end
  end
end
