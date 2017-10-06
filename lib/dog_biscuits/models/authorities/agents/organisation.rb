# frozen_string_literal: true

module DogBiscuits
  class Organisation < DogBiscuits::Agent
    # Local
    include DogBiscuits::GenericQualifier
    include DogBiscuits::HubDates
    include DogBiscuits::Pure
    include DogBiscuits::PureSpecificBehaviour
    include DogBiscuits::RdfType

    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Organization]

    def concept?
      false
    end

    def concept_scheme?
      false
    end

    def group?
      false
    end

    def organisation?
      true
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
