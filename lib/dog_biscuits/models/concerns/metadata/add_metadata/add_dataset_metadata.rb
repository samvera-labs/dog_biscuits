# frozen_string_literal: true

module DogBiscuits
  # add dataset metadata
  module AddDatasetMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata
    include DogBiscuits::Doi
    include DogBiscuits::Publisher
    include DogBiscuits::Available
    include DogBiscuits::ForIndexing
    include DogBiscuits::AccessRights
    include DogBiscuits::Pure
    include DogBiscuits::GenericWorkflow
    include DogBiscuits::ReadmeFile
    include DogBiscuits::LastAccess
    include DogBiscuits::NumberOfDownloads
    include DogBiscuits::SimpleVersions
    include DogBiscuits::ManagingOrganisation
  end
end
