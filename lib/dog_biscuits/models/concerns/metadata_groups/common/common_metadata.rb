# frozen_string_literal: true

module DogBiscuits
  # Common metadata for all collections and works.
  module CommonMetadata
    extend ActiveSupport::Concern

    # Other Common concerns
    include DogBiscuits::CommonLabels
    include DogBiscuits::CommonRights

    # Common dc properties
    # dc:title is included in Core Metadata
    include DogBiscuits::Creator
    include DogBiscuits::Contributor
    include DogBiscuits::Date
    include DogBiscuits::Description
    include DogBiscuits::Identifier
    include DogBiscuits::KeywordSubject
    include DogBiscuits::Language
    include DogBiscuits::Publisher
    include DogBiscuits::ResourceType

    # Common other properties
    include DogBiscuits::Doi
    include DogBiscuits::ManagingOrganisation
    include DogBiscuits::RelatedUrl

    # Common dlib properties
    include DogBiscuits::CollectionsCategory
    include DogBiscuits::FormerIdentifier
  end
end
