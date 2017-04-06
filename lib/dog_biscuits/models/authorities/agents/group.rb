# frozen_string_literal: true

module DogBiscuits
  # historical group or organisation
  class Group < DogBiscuits::Agent
    include DogBiscuits::BorthwickNote
    include DogBiscuits::FoafName
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates

    # TODO: create preflabel

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

    def agent?
      false
    end

    def person?
      false
    end

    def organisation?
      false
    end

    def place?
      false
    end
  end
end
