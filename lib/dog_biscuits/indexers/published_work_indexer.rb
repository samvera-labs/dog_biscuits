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

    # Add any custom indexing into here. Method must exist, but can be empty.
    def do_local_indexing(solr_doc)
      (labels ||= []) << object.editor_resource.collect(&:preflabel) if object.editor_resource.present?
      (labels ||= []) << object.editor.to_a if object.editor.present?
      labels.flatten!.uniq!

      if solr_doc['contributor_label_tesim'].blank? && labels.present?
        solr_doc['contributor_label_tesim'] = labels
        solr_doc['contributor_label_sim'] = labels
      elsif labels.present?
        solr_doc['contributor_label_tesim'].push(*labels).uniq!
        solr_doc['contributor_label_sim'].push(*labels).uniq!
      end
    end
  end
end
