# frozen_string_literal: true

module DogBiscuits
  # add package metadata
  module AddPackageMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonLabels
    include DogBiscuits::Archivematica
    include DogBiscuits::RdfType # needed for add_types callback
    include DogBiscuits::SimpleVersions
  end
end
