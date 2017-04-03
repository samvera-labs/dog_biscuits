module DogBiscuits
  # concept
  class Concept < Authority
    # TODO: add an after save, to find any usages and update_index / object; ditto for people etc.
    include DogBiscuits::CommonLabels,
            DogBiscuits::GenericAuthorityTerms,
            DogBiscuits::OwlSameAs,
            DogBiscuits::RdfsSeeAlso, # use for external see also links
            Hyrax::Noid

    # Use for nested schemes
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

    # The following MUST NOT be the same as broader or narrower.
    # TODO: validate this?
    has_and_belongs_to_many :see_also,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.related,
                            inverse_of: :see_also

    has_and_belongs_to_many :exact_match,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.exactMatch

    has_and_belongs_to_many :close_match,
                            class_name: 'DogBiscuits::Concept',
                            predicate: ::RDF::Vocab::SKOS.closeMatch

    type [::RDF::URI.new('http://www.w3.org/2004/02/skos/core#Concept')]

    property :definition, predicate: ::RDF::Vocab::SKOS.definition,
                          multiple: false do |index|
      index.as :stored_searchable
    end

    property :skos_note, predicate: ::RDF::Vocab::SKOS.note,
                         multiple: false do |index|
      index.as :stored_searchable
    end

    def concept?
      true
    end
    def agent?
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
