# frozen_string_literal: true

module DogBiscuits
  module AddDatasetMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::AccessRights
    include DogBiscuits::Available
    include DogBiscuits::Doi
    include DogBiscuits::EmbargoRelease
    include DogBiscuits::ForIndexing
    include DogBiscuits::HasRestriction
    include DogBiscuits::LastAccess
    include DogBiscuits::ManagingOrganisation
    include DogBiscuits::NumberOfDownloads
    include DogBiscuits::Pure
    include DogBiscuits::Publisher
    include DogBiscuits::ReadmeFile
    include DogBiscuits::SimpleVersions
  end
end
