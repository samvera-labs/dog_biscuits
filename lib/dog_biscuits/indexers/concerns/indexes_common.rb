# frozen_string_literal: true

module DogBiscuits
  module IndexesCommon
    attr_accessor :strings_to_index, :labels_to_index

    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc_for_labels(solr_doc)
        solr_doc_for_strings(solr_doc)
        solr_doc_for_contributors(solr_doc)
        solr_doc_for_dates(solr_doc)
        do_local_indexing(solr_doc)
      end
    end

    # Index resource fields into the _label field
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

        solr_doc[Solrizer.solr_name("#{v}_label", :stored_searchable)] = prefs if prefs.present?
        solr_doc[Solrizer.solr_name("#{v}_label", :facetable)] = prefs if prefs.present?

        alts = object.send(method).collect(&:altlabel).to_a.flatten!
        solr_doc["#{v}_label_alt_tesim"] = alts if alts.present?

        # This field is used for upating usages when an authority changes or is destroyed.
        solr_doc['values_tesim'] = object.send(method).collect(&:id)
      end
    end

    # Index string fields into the _label field
    def solr_doc_for_strings(solr_doc)
      strings_to_index.each do |v|
        strings = object.send(v).to_a
        # This will replace the field, thus getting rid of any indexing conflicts with HABM
        solr_doc[Solrizer.solr_name(v, :stored_searchable)] = strings
        solr_doc[Solrizer.solr_name(v, :facetable)] = strings

        # If there is anything in the solr_doc, add to it
        if solr_doc["#{v}_label_tesim"]
          solr_doc[Solrizer.solr_name("#{v}_label", :stored_searchable)].push(*strings).uniq!
          solr_doc[Solrizer.solr_name("#{v}_label", :facetable)].push(*strings).uniq!
        else
          solr_doc[Solrizer.solr_name("#{v}_label", :stored_searchable)] = strings
          solr_doc[Solrizer.solr_name("#{v}_label", :facetable)] = strings
        end
      end
    end

    # rubocop:disable Style/GuardClause

    # Index different contributor types (relators, eg. editor, advisor) into contributor
    # Index the contributor type itself
    def solr_doc_for_contributors(solr_doc)
      if respond_to? :contributors_to_index
        contributors_to_index.each do |v|
          labels = object.send(v).to_a
          labels.push(*object.send("#{v}_resource").collect(&:preflabel))
          # If there is anything in the solr_doc, add to it
          if solr_doc["contributor_combined_tesim"]
            solr_doc[Solrizer.solr_name("contributor_combined", :stored_searchable)].push(*labels).uniq!
            solr_doc[Solrizer.solr_name("contributor_combined", :facetable)].push(*labels).uniq!
          else
            solr_doc[Solrizer.solr_name("contributor_combined", :stored_searchable)] = labels
            solr_doc[Solrizer.solr_name("contributor_combined", :facetable)] = labels
          end
          # I don't think the logic is quite right here as there will only ever be one result
          labels.each do |_label|
            if solr_doc['contributor_type_sim']
              solr_doc[Solrizer.solr_name("contributor_type", :facetable)] << v
            else
              solr_doc[Solrizer.solr_name("contributor_type", :facetable)] = [v]
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
