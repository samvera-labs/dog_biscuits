# frozen_string_literal: true

module DogBiscuits
  class ConceptScheme < Authority
    include DogBiscuits::Description
    include Hyrax::Noid

    before_save :add_label

    has_many :concepts, class_name: 'DogBiscuits::Concept', inverse_of: :concept_scheme
    has_many :organisations, class_name: 'DogBiscuits::Organisation', inverse_of: :concept_scheme
    has_many :departments, class_name: 'DogBiscuits::Organisation', inverse_of: :concept_scheme
    has_many :people, class_name: 'DogBiscuits::Person', inverse_of: :concept_scheme
    has_many :persons
    has_many :places, class_name: 'DogBiscuits::Place', inverse_of: :concept_scheme
    has_many :groups, class_name: 'DogBiscuits::Group', inverse_of: :concept_scheme
    has_many :projects, class_name: 'DogBiscuits::Project', inverse_of: :concept_scheme

    # Used for nested schemes. Will be added automatically via Concept.
    has_and_belongs_to_many :has_top_concept,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.hasTopConcept,
                            inverse_of: :top_concept_of

    type [::RDF::URI.new('http://www.w3.org/2004/02/skos/core#ConceptScheme')]

    def concept_scheme?
      true
    end

    def agent?
      false
    end

    def person?
      false
    end

    def organisation?
      false
    end

    def group?
      false
    end

    def place?
      false
    end

    def concept?
      false
    end

    def add_label
      self.rdfs_label = preflabel if preflabel.present?
      self.preflabel = rdfs_label if rdfs_label.present?
    end
  end
end
