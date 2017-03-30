module DogBiscuits
  # contemporary (current) organisation
  class Organisation < DogBiscuits::Agent
    include DogBiscuits::FoafName,
            DogBiscuits::Pure
            # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    # TODO create preflabel

    type [::RDF::URI.new('https://schema.org/Organization'),
         ::RDF::Vocab::FOAF.Agent,
         ::RDF::Vocab::FOAF.Organization]

    before_save :add_pure_type

    def add_pure_type
      type << DogBiscuits::Vocab::PureTerms.Organisation unless pure_uuid.nil?
    end

    def organisation?
      true
    end
    def person?
      false
    end
  end
end
