# frozen_string_literal: true

module DogBiscuits
  module IndexesCommon
    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc_for_contributors(solr_doc)
        solr_doc_for_dates(solr_doc)
        do_local_indexing(solr_doc)
      end
    end

    # rubocop:disable Style/GuardClause

    # Index different contributor types (relators, eg. editor, advisor) into contributor
    # Index the contributor type itself
    def solr_doc_for_contributors(solr_doc)
      if respond_to? :contributors_to_index
        contributors_to_index.each do |v|
          labels = object.send(v).to_a
          # If there is anything in the solr_doc, add to it
          if solr_doc["contributor_combined_tesim"]
            solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_combined", :stored_searchable)].push(*labels).uniq!
            solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_combined", :facetable)].push(*labels).uniq!
          else
            solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_combined", :stored_searchable)] = labels
            solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_combined", :facetable)] = labels
          end
          labels.each do |_label|
            if solr_doc['contributor_type_sim']
              solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_type", :facetable)] << v
            else
              solr_doc[ActiveFedora.index_field_mapper.solr_name("contributor_type", :facetable)] = [v]
            end
          end
        end
      end
    end

    # Extract years from all date fields and index into 'date_range_sim'
    def solr_doc_for_dates(solr_doc)
      DogBiscuits.config.date_properties.each do |d|
        next unless object.respond_to? d
        object.send(d).each do |dd|
          dd.to_s.scan(/\b\d{4}\b/).each do |year|
            if solr_doc['date_range_sim']
              solr_doc['date_range_sim'] << year.to_i
            else
              solr_doc['date_range_sim'] = [year.to_i]
            end
          end
        end
      end
    end

    # rubocop:enable Style/GuardClause
  end
end
