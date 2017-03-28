module DogBiscuits
  # add dataset metadata
  module AddDatasetMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata,
            DogBiscuits::Doi,
            DogBiscuits::Publisher,
            DogBiscuits::Available,
            DogBiscuits::ForIndexing,
            DogBiscuits::AccessRights,
            DogBiscuits::Pure,
            DogBiscuits::GenericWorkflow,
            DogBiscuits::ReadmeFile,
            DogBiscuits::LastAccess,
            DogBiscuits::NumberOfDownloads,
            DogBiscuits::SimpleVersions,
            DogBiscuits::ManagingOrganisation

  end
end
