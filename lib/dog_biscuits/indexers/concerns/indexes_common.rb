# frozen_string_literal: true

module DogBiscuits
  module IndexesCommon
    attr_accessor :strings_to_index, :values_to_index

    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc['values_tesim'] = []

        # Index preflabel and altlabels into solr.
        values_to_index.each do |v|
          method = "#{v}_resource"
          solr_doc["#{v}_label_alt_tesim"] = []
          prefs = object.send(method).collect(&:preflabel)
          solr_doc["#{v}_label_tesim"] = prefs # stored searchable
          solr_doc["#{v}_label_sim"] = prefs # facetable

          object.send(method).each do |a|
            solr_doc["#{v}_label_alt_tesim"] += a.altlabel.to_a
          end

          # This field is used for upating usages when an authority changes or is destroyed.
          solr_doc['values_tesim'] += object.send(method).collect(&:id)
        end

        strings_to_index.each do |v|
          method = "#{v}_resource"
          strings = object.send(method).collect(&:preflabel)
          solr_doc["#{v}_label_tesim"] = strings # stored searchable
          solr_doc["#{v}_label_sim"] = strings # facetable
        end

        # Add any additional local indexing for the including model.
        do_local_indexing(solr_doc)
      end
    end
  end
end
