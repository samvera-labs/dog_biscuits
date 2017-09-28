# frozen_string_literal: true

module DogBiscuits
  # All authority classes inherit from this.
  class Authority < ActiveFedora::Base
    include DogBiscuits::CommonLabels
    include DogBiscuits::SkosNote
    include DogBiscuits::ValidateLabel

    before_save :add_label
    after_save :update_usages
    after_destroy :update_usages

    belongs_to :concept_scheme,
               class_name: 'DogBiscuits::ConceptScheme',
               predicate: ::RDF::Vocab::SKOS.inScheme

    def authority?
      true
    end

    def work?
      false
    end

    def file_set?
      false
    end

    def collection?
      false
    end

    def edit_groups
      ['admin']
    end

    # Find any objects that use the authority term being updated or destroyed
    #   run a solr update on each object.
    def update_usages
      num = num_usages.to_i
      unless num.nil? || num.zero?
        ActiveFedora::SolrService.get(
          "values_tesim:#{id}",
          fl: 'id',
          rows: num
        )['response']['docs'].each do |r|
          ActiveFedora::Base.find(r['id']).update_index
        end
      end
    end

    # Get the number of objects to update.
    def num_usages
      ActiveFedora::SolrService.get(
        "values_tesim:#{id}",
        fl: 'id',
        rows: 0
      )['response']['numResults']
    end

    # Ensure rdfs label and pref label and the same. Prefer preflabel.
    def add_label
      self.rdfs_label = preflabel if preflabel.present?
      self.preflabel = rdfs_label if rdfs_label.present?
    end
  end
end
