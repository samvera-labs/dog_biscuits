# frozen_string_literal: true

module DogBiscuits
  module PublishedWorkMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Abstract
    include DogBiscuits::DateAvailable
    include DogBiscuits::DatePublished
    include DogBiscuits::DateSubmitted
    include DogBiscuits::DateAccepted
    include DogBiscuits::Edition
    include DogBiscuits::Editor
    include DogBiscuits::IssueNumber
    include DogBiscuits::Isbn
    include DogBiscuits::OfficialUrl
    include DogBiscuits::Pagination
    include DogBiscuits::Part
    include DogBiscuits::PlaceOfPublication
    include DogBiscuits::PublicationStatus
    include DogBiscuits::Refereed
    include DogBiscuits::Series
    include DogBiscuits::VolumeNumber
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
