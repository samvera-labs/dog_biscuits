# frozen_string_literal: true

module DogBiscuits
  module Archivematica
    extend ActiveSupport::Concern

    included do
      property :aip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipUuid do |index|
        index.as :stored_searchable
      end
      property :transfer_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.transferUuid do |index|
        index.as :stored_searchable
      end
      property :sip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.sipUuid do |index|
        index.as :stored_searchable
      end
      property :dip_uuid,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipUuid do |index|
        index.as :stored_searchable
      end
      property :aip_status,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipStatus do |index|
        index.as :stored_searchable
      end
      property :dip_status,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipStatus do |index|
        index.as :stored_searchable
      end
      property :aip_size,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipSize do |index|
        index.as :stored_searchable
      end
      property :dip_size,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipSize do |index|
        index.as :stored_searchable
      end
      property :aip_current_path,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipCurrentPath do |index|
        index.as :stored_searchable
      end
      property :dip_current_path,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipCurrentPath do |index|
        index.as :stored_searchable
      end
      property :aip_current_location,
               predicate:
                   DogBiscuits::Vocab::OaisArchivematica.aipCurrentLocation do |index|
        index.as :stored_searchable
      end
      property :dip_current_location,
               predicate:
                   DogBiscuits::Vocab::OaisArchivematica.dipCurrentLocation do |index|
        index.as :stored_searchable
      end
      property :aip_resource_uri,
               predicate: DogBiscuits::Vocab::OaisArchivematica.aipResourceUri do |index|
        index.as :stored_searchable
      end
      property :dip_resource_uri,
               predicate: DogBiscuits::Vocab::OaisArchivematica.dipResourceUri do |index|
        index.as :stored_searchable
      end
      # This will always be the same for both AIP and DIP
      property :origin_pipeline,
               predicate: DogBiscuits::Vocab::OaisArchivematica.originPipeline do |index|
        index.as :stored_searchable
      end
    end
  end
end
