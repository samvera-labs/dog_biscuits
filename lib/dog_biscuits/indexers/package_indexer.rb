# frozen_string_literal: true

module DogBiscuits
  class PackageIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
    #   are indexed in solr
    # Method must exist, but can return an empty array
    def labels_to_index
      []
    end

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    # Method must exist, but can return an empty array
    def strings_to_index
      []
    end

    def do_local_indexing(solr_doc); end
  end
end
