# frozen_string_literal: true

module DogBiscuits
  module IndexesPublishedItem
    extend ActiveSupport::Concern
    include DogBiscuits::IndexesCommon

    included do
      # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
      #   are indexed in solr
      def values_to_index
        ['creator', 'editor', 'contributor', 'managing_organisation']
      end

      # Add any properties to ensure they are 'mixed in' with the *_values field in solr
      def strings_to_index
        ['creator', 'editor', 'contributor']
      end

      # Add any custom indexing into here. Method must exist, but can be empty.
      def do_local_indexing(solr_doc)
        solr_doc['contributor_value_tesim'] = object.editor_resource.collect(&:preflabel)
        solr_doc['contributor_value_sim'] = object.editor_resource.collect(&:preflabel)
      end
    end
  end
end
