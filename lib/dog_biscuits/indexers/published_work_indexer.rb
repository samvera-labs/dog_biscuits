# frozen_string_literal: true

module DogBiscuits
  class PublishedWorkIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
    #   are indexed in solr
    def labels_to_index
      ['creator', 'editor', 'contributor', 'managing_organisation']
    end

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    def strings_to_index
      ['creator', 'editor', 'contributor']
    end

    def contributors_to_index
      ['editor']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc); end
  end
end
