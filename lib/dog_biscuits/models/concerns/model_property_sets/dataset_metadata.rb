# frozen_string_literal: true

module DogBiscuits
  module DatasetMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::Abstract # added
    include DogBiscuits::AccessRights
    include DogBiscuits::DateAvailable
    include DogBiscuits::ContentVersion # added
    include DogBiscuits::DateAccepted # added
    include DogBiscuits::DateCollected # added
    include DogBiscuits::DateCopyrighted # added
    include DogBiscuits::DateIssued # added
    include DogBiscuits::DatePublished # added
    include DogBiscuits::DateSubmitted # added
    include DogBiscuits::DateUpdated # added
    include DogBiscuits::DateValid # added
    include DogBiscuits::Extent # added
    include DogBiscuits::ForIndexing
    include DogBiscuits::Format # added
    include DogBiscuits::Funder # added
    include DogBiscuits::ResourceTypeGeneral # added
    include DogBiscuits::HasRestriction
    include DogBiscuits::LastAccess
    include DogBiscuits::NumberOfDownloads
    include DogBiscuits::PackagedBy
    # include DogBiscuits::Pure  # removed
    include DogBiscuits::ReadmeFile
    include DogBiscuits::RequestorEmail
    include DogBiscuits::SimpleVersions
    include DogBiscuits::Subtitle
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
