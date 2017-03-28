module DogBiscuits
  module IndexesCommon
    extend ActiveSupport::Concern

    included do

      def generate_solr_document

        values_to_index = get_values_to_index
        strings_to_index = get_strings_to_index

        super.tap do |solr_doc|
          solr_doc['values_tesim'] = []

          values_to_index.each do |v|
            method = "#{v}_resource"
            solr_doc["#{v}_value_alt_tesim"] = []
            prefs = object.send(method).collect { |x| x.preflabel }
            solr_doc["#{v}_value_tesim"] = prefs # stored searchable
            solr_doc["#{v}_value_sim"] = prefs # facetable

            object.send(method).each do |a|
              solr_doc["#{v}_value_alt_tesim"] += a.altlabel.to_a
            end

            # what's this one doing?
            solr_doc['values_tesim'] += object.send(method).collect { |x| x.id }
          end

          strings_to_index.each do |v|
            method = "#{v}_resource"
            strings = object.send(method).collect { |x| x.preflabel }
            solr_doc["#{v}_value_tesim"] = strings # stored searchable
            solr_doc["#{v}_value_sim"] = strings # facetable
          end

          # add any additional local indexing for the including model
          do_local_indexing(solr_doc)

        end
      end
    end
  end
end