# frozen_string_literal: true

module DogBiscuits
  class Group < DogBiscuits::Agent
    # Additional
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates

    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Group]

    property :group_type, predicate: DogBiscuits::Vocab::Generic.groupType do |index|
      index.as :stored_searchable
    end

    property :foaf_member, predicate: ::RDF::Vocab::FOAF.member do |index|
      index.as :stored_searchable
    end

    def concept?
      false
    end

    def concept_scheme?
      false
    end

    def group?
      true
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
