# frozen_string_literal: true

module DogBiscuits
  class DigitalArchivalObjectIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add *all* properties called _resource to ensure the preflabel and altlabel of the related object
    #   are indexed in the _label solr field
    # Method must exist, but can return an empty array
    def labels_to_index
      ['creator']
    end

    # Add string properties that have a parallel _resource property to ensure they are mixed into the _label solr field
    # Method must exist, but can return an empty array
    def strings_to_index
      ['creator', 'access_provided_by']
    end

    def contributors_to_index
      []
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc)
      solr_doc['packaged_by_ids_ssim'] = object.packaged_by.map(&:id)
      solr_doc['packaged_by_titles_tesim'] = object.packaged_by.map(&:first_title)
    end
  end
end
