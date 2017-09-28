# frozen_string_literal: true

module DogBiscuits
  class DatasetIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
    #   are indexed in solr
    # Method must exist, but can return an empty array
    def labels_to_index
      ['creator', 'publisher', 'managing_organisation']
    end

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    # Method must exist, but can return an empty array
    def strings_to_index
      []
    end

    # Force the type of certain indexed fields in solr
    # (inspired by
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-63,
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-64
    #   and discussed at
    #   https://groups.google.com/forum/#!topic/hydra-tech/rRsBwdvh5dE)
    # This is to overcome limitations with solrizer and
    #   "index.as :stored_sortable" always defaulting to string rather
    #   than text type (solr sorting on string fields is case-sensitive,
    #   on text fields it's case-insensitive)
    def do_local_indexing(solr_doc)
      solr_doc['dc_access_rights_tesi'] = object.dc_access_rights.collect { |x| x }
    end
  end
end
