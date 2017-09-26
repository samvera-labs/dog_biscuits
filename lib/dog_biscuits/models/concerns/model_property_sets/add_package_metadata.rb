# frozen_string_literal: true

module DogBiscuits
  # add package metadata
  module AddPackageMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Archivematica
    include DogBiscuits::RdfType
    include DogBiscuits::SimpleVersions
  end
end
