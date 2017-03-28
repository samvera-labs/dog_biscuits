module DogBiscuits
  # historical group or organisation
  class Group < DogBiscuits::Agent
    include DogBiscuits::BorthwickNote,
            DogBiscuits::FoafName,
            DogBiscuits::GenericQualifier,
            DogBiscuits::HubDates
    # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    # TODO create preflabel

    # removed ::RDF::URI.new('https://schema.org/Organization')
    # ::RDF::URI.new('http://purl.org/vra/Organization')
    type [::RDF::URI.new('http://vocab.getty.edu/ontology#GroupConcept'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Group]

    property :group_type, predicate: DogBiscuits::Vocab::Generic.groupType,
                          multiple: true do |index|
      index.as :stored_searchable
    end
    def group?
      true
    end
  end
end
