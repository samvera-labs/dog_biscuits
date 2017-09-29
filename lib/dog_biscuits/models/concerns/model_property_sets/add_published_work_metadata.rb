# frozen_string_literal: true

module DogBiscuits
  module AddPublishedWorkMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Abstract
    include DogBiscuits::Available
    include DogBiscuits::DatePublished
    include DogBiscuits::DateSubmitted
    include DogBiscuits::DateAccepted
    include DogBiscuits::Edition
    include DogBiscuits::Editor
    include DogBiscuits::IssueNumber
    include DogBiscuits::Isbn
    include DogBiscuits::OfficialUrl
    include DogBiscuits::ManagingOrganisation
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
