# frozen_string_literal: true

module DogBiscuits
  module IndexesPublishedWork
    include DogBiscuits::IndexesCommon

    # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
    #   are indexed in solr
    def values_to_index
      ['creator', 'editor', 'contributor', 'managing_organisation']
    end

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    def strings_to_index
      ['creator', 'editor', 'contributor']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    def do_local_indexing(solr_doc)
      solr_doc['contributor_label_tesim'] = object.editor_resource.collect(&:preflabel)
      solr_doc['contributor_label_sim'] = object.editor_resource.collect(&:preflabel)
    end
  end
end
