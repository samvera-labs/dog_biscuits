# frozen_string_literal: true

module DogBiscuits
  # common metadata for all
  module CommonMetadata
    extend ActiveSupport::Concern

    # Other Common concerns
    include DogBiscuits::CommonLabels
    include DogBiscuits::CommonRights

    # Common dc properties
    # dc:title is included in RequiredMetadata
    include DogBiscuits::Creator
    include DogBiscuits::Date
    include DogBiscuits::Description
    include DogBiscuits::Identifier
    include DogBiscuits::KeywordSubject
    include DogBiscuits::Language
    include DogBiscuits::Publisher

    # Common other properties
    include DogBiscuits::RelatedUrl
    include DogBiscuits::Doi
    include DogBiscuits::ManagingOrganisation

    # Common dlib properties
    include DogBiscuits::FormerIdentifier
    include DogBiscuits::CollectionsCategory
  end
end
