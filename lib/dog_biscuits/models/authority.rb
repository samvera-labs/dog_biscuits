# frozen_string_literal: true

module DogBiscuits
  # all authority classes extend this
  class Authority < ActiveFedora::Base
    include DogBiscuits::CommonLabels
    include DogBiscuits::ValidateLabel

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
      ActiveFedora::SolrService.get(
        "values_tesim:#{id}",
        fl: 'id',
        rows: 1000

      )['response']['docs'].each do |r|
        ActiveFedora::Base.find(r['id']).update_index
      end
    end
  end
end
