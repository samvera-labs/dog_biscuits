# frozen_string_literal: true

module DogBiscuits
  class Person < DogBiscuits::Agent
    # HyBox
    include DogBiscuits::AlternateName
    include DogBiscuits::PersonProperties
    # Additional
    include DogBiscuits::HubDates
    include DogBiscuits::Pure # Metadata from PURE web service
    include DogBiscuits::PureSpecific # Behaviour for dealing with PURE records
    include DogBiscuits::RdfType
    include DogBiscuits::Orcid

    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person]

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
      false
    end

    def person?
      true
    end

    def place?
      false
    end

    def project?
      false
    end

    # Generate dates string from birth/death.
    def add_dates
      dt = ''
      dt += "#{birth_date}-" if birth_date.present?
      dt += death_date if death_date.present?
      self.dates = dt if dt.present?
    end

    # Generate the name from parts.
    def add_name
      nm = ''
      nm += prefix if prefix.present?
      nm += " #{given_name}" if given_name.present?
      nm += " #{family_name}" if family_name.present?
      nm += " #{suffix}" if suffix.present?
      nm = nm.sub(' ', '') if nm.starts_with? ' '
      self.name = nm if nm.present?
    end

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      add_name
      add_dates
      label = name if name.present?
      label += ", #{dates}" if name.present? && dates.present?
      self.rdfs_label = label
      add_preflabel
    end
  end
end
