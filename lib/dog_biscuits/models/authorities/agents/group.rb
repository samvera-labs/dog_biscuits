# frozen_string_literal: true

module DogBiscuits
  # historical group or organisation
  class Group < DogBiscuits::Agent
    # Additional
    include DogBiscuits::BorthwickNote
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates

    # ::RDF::URI.new('http://vocab.getty.edu/ontology#GroupConcept')
    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Group]

    property :group_type, predicate: DogBiscuits::Vocab::Generic.groupType,
                          multiple: true do |index|
      index.as :stored_searchable
    end

    property :foaf_member, predicate: ::RDF::Vocab::FOAF.member,
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

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      label = ''
      label += ", #{name}" if name.present?
      label += ", #{dates}" if dates.present?
      label += ", #{qualifier}" if qualifier.present?
      label = label.sub(', ', '') if label.starts_with? ', '
      self.rdfs_label = label if label.present?
      add_preflabel
    end
  end
end
