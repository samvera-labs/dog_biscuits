# frozen_string_literal: true

module DogBiscuits
  # All authority classes inherit from this.
  class Authority < ActiveFedora::Base
    include DogBiscuits::CommonLabels
    include DogBiscuits::SkosNote
    include DogBiscuits::ValidateLabel

    before_save :add_label

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

    # Ensure rdfs label and pref label and the same. Prefer preflabel.
    def add_label
      self.rdfs_label = preflabel if preflabel.present?
      self.preflabel = rdfs_label if rdfs_label.present?
    end
  end
end
