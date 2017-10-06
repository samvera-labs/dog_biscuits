# frozen_string_literal: true

module DogBiscuits
  class Concept < Authority
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::OwlSameAs
    include DogBiscuits::SkosRelated
    include DogBiscuits::ValidateConceptRelated

    # Use for nested schemes.
    has_and_belongs_to_many :top_concept_of,
                            class_name: 'DogBiscuits::ConceptScheme',
                            predicate: ::RDF::Vocab::SKOS.topConceptOf,
                            inverse_of: :has_top_concept

    # Use only for Broader. Narrower will be added by default as the inverse.
    has_and_belongs_to_many :broader,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.broader,
                            inverse_of: :narrower
    has_and_belongs_to_many :narrower,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.narrower,
                            inverse_of: :broader

    # MUST NOT be the same as broader/narrower; validator in place
    has_and_belongs_to_many :related,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.related,
                            inverse_of: :related

    type [::RDF::URI.intern('http://www.w3.org/2004/02/skos/core#Concept')]

    property :definition, predicate: ::RDF::Vocab::SKOS.definition,
                          multiple: false do |index|
      index.as :stored_searchable
    end

    property :exact_match, predicate: ::RDF::Vocab::SKOS.exactMatch do |index|
      index.as :stored_searchable
    end

    property :close_match, predicate: ::RDF::Vocab::SKOS.closeMatch do |index|
      index.as :stored_searchable
    end

    def agent?
      false
    end

    def concept?
      true
    end

    def concept_scheme?
      false
    end

    def event?
      false
    end

    def group?
      false
    end

    def organisation?
      false
    end

    def person?
      false
    end

    def place?
      false
    end

    def project?
      false
    end

    def topconcept?
      if top_concept_of.first.is_a? DogBiscuits::ConceptScheme
        true
      else
        false
      end
    end
  end
end
