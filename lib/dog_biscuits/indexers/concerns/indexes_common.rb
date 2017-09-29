# frozen_string_literal: true

module DogBiscuits
  module IndexesCommon
    # include Hyrax::IndexesLinkedMetadata # needs to be de-coupled from basic indexer
    attr_accessor :strings_to_index, :labels_to_index

    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc_for_labels(solr_doc)
        solr_doc_for_strings(solr_doc)
        do_local_indexing(solr_doc)
      end
    end

    def solr_doc_for_labels(solr_doc)
      # Index preflabel and altlabels into solr for _resource HABMs.
      labels_to_index.each do |v|
        method = "#{v}_resource"

        # HABMs are indexed as predicate name, so index them as property name
        solr_doc["#{v}_resource_ssim"] = object.send(method).collect(&:id)

        # Remove existing indexing remove any potential conflicts with strings
        solr_doc.delete("#{v}_ssim")

        prefs = object.send(method).collect(&:preflabel)

        # Create a new array
        solr_doc["#{v}_label_tesim"] = prefs if prefs.present? # stored_searchable
        solr_doc["#{v}_label_sim"] = prefs if prefs.present? # facetable

        alts = object.send(method).collect(&:altlabel).to_a.flatten!
        solr_doc["#{v}_label_alt_tesim"] = alts if alts.present?

        # This field is used for upating usages when an authority changes or is destroyed.
        solr_doc['values_tesim'] = object.send(method).collect(&:id)
      end
    end

    def solr_doc_for_strings(solr_doc)
      strings_to_index.each do |v|
        strings = object.send(v).to_a
        # This will replace the field, thus getting rid of any indexing conflicts with HABM
        solr_doc["#{v}_tesim"] = strings
        solr_doc["#{v}_sim"] = strings

        # If there is anything in the solr_doc, add to it
        if solr_doc["#{v}_label_tesim"]
          solr_doc["#{v}_label_tesim"].push(*strings).uniq!
          solr_doc["#{v}_label_sim"].push(*strings).uniq!
        else
          solr_doc["#{v}_label_tesim"] = strings
          solr_doc["#{v}_label_sim"] = strings
        end
      end
    end
  end
end
