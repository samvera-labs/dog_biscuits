# frozen_string_literal: true

module DogBiscuits
  class DigitalArchivalObjectIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    def contributors_to_index
      []
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc)
      solr_doc['packaged_by_ids_ssim'] = object.packaged_by.map(&:id)
      solr_doc['packaged_by_titles_sim'] = object.packaged_by.map(&:first_title)
    end
  end
end
