# frozen_string_literal: true

module DogBiscuits
  class ThesisIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add *all* properties called _resource to ensure the preflabel and altlabel of the related object
    #   are indexed in the _label solr field
    # Method must exist, but can return an empty array
    def labels_to_index
      ['creator', 'advisor', 'department', 'awarding_institution']
    end

    # Add string properties that have a parallel _resource property to ensure they are mixed into the _label solr field
    # Method must exist, but can return an empty array
    def strings_to_index
      ['creator', 'advisor']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc)
      (labels ||= []) << object.advisor_resource.collect(&:preflabel) if object.advisor_resource.present?
      (labels ||= []) << object.advisor.to_a if object.advisor.present?
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
