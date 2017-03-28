module DogBiscuits
  # add package metadata
  module AddPackageMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonLabels,
            DogBiscuits::Archivematica,
            DogBiscuits::RdfType, # needed for add_types callback
            DogBiscuits::SimpleVersions
  end
end
