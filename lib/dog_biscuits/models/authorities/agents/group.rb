# frozen_string_literal: true

module DogBiscuits
  # historical group or organisation
  class Group < DogBiscuits::Agent
    include DogBiscuits::BorthwickNote
    include DogBiscuits::FoafName
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates

    before_save :add_preflabel

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

    # Generate a preflabel from the name parts. Overwrite the existing preflabel.
    def add_preflabel
      label = ''
      label += ", #{name}" if name.present?
      label += ", #{dates}" if dates.present?
      label += ", #{qualifier}" if qualifier.present?
      label = label.sub(', ','') if label.starts_with? ', '
      self.preflabel = label
    end
  end
end
