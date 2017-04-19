# frozen_string_literal: true

module DogBiscuits
  # contemporary (current) organisation
  class Organisation < DogBiscuits::Agent
    # HyBox
    include DogBiscuits::FoafName
    # Local
    include DogBiscuits::Pure
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates

    before_save :add_pure_type

    # ::RDF::URI.new('https://schema.org/Organization')
    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Organization]

    def add_pure_type
      type << DogBiscuits::Vocab::PureTerms.Organisation unless pure_uuid.nil?
    end

    def organisation?
      true
    end

    def person?
      false
    end

    def agent?
      false
    end

    def group?
      false
    end

    def place?
      false
    end

    # Generate a preflabel from the name parts. Overwrite the existing preflabel.
    def add_label
      label = ''
      label += ", #{name}" if name.present?
      label += ", #{dates}" if dates.present?
      label += ", #{qualifier}" if qualifier.present?
      label = label.sub(', ', '') if label.starts_with? ', '
      self.rdfs_label = label
      add_preflabel
    end
  end
end
