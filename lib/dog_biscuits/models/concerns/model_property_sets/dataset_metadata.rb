# frozen_string_literal: true

module DogBiscuits
  module DatasetMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::AccessRights
    include DogBiscuits::Available
    # include DogBiscuits::EmbargoRelease
    include DogBiscuits::ForIndexing
    include DogBiscuits::HasRestriction
    include DogBiscuits::LastAccess
    include DogBiscuits::NumberOfDownloads
    include DogBiscuits::PackagedBy
    include DogBiscuits::Pure
    include DogBiscuits::ReadmeFile
    include DogBiscuits::RequestorEmail
    include DogBiscuits::SimpleVersions
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
