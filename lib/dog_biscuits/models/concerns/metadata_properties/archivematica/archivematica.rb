# frozen_string_literal: true

module DogBiscuits
  module Archivematica
    extend ActiveSupport::Concern

    included do
      property :aip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :transfer_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.transferUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :sip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.sipUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_status,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipStatus,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_status,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipStatus,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_size,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipSize,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_size,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipSize,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_current_path,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipCurrentPath,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_current_path,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipCurrentPath,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_current_location,
               predicate:
                   DogBiscuits::Vocab::OaisArchivematica.aipCurrentLocation,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_current_location,
               predicate:
                   DogBiscuits::Vocab::OaisArchivematica.dipCurrentLocation,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_resource_uri,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipResourceUri,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_resource_uri,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipResourceUri,
               multiple: false do |index|
        index.as :stored_searchable
      end
      # This will always be the same for both AIP and DIP
      property :origin_pipeline,
               predicate: DogBiscuits::Vocab::OaisArchivematica.originPipeline,
               multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
