# frozen_string_literal: true

module DogBiscuits
  # current person (not historical)
  class Person < DogBiscuits::Agent
    # HyBox
    include DogBiscuits::AlternateName
    include DogBiscuits::AddPersonProperties
    # Additional
    include DogBiscuits::HubDates
    include DogBiscuits::Pure
    include DogBiscuits::RdfType
    include DogBiscuits::Orcid

    before_save :add_pure_type

    # ::RDF::URI.new('http://schema.org/Person')
    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person]

    def person?
      true
    end

    # incorrect
    def agent?
      false
    end

    def organisation?
      false
    end

    def group?
      false
    end

    def place?
      false
    end

    # TODO: review as specific to York local requirements
    def add_pure_type
      rdf_type << DogBiscuits::Vocab::PureTerms.Person unless pure_uuid.nil?
    end

    # TODO: review as specific to York local requirements TEST
    def phd
      rdf_type << DogBiscuits::Vocab::PureTerms.PhdStudent
    end

    def add_dates
      dt = ''
      dt += "#{birth_date}-" if birth_date.present?
      dt += death_date if death_date.present?
      self.dates = dt if dt.present?
    end

    def add_name
      nm = ''
      nm += prefix if prefix.present?
      nm += " #{given_name}" if given_name.present?
      nm += " #{family_name}" if family_name.present?
      nm += " #{suffix}" if suffix.present?
      nm = nm.sub(' ', '') if nm.starts_with? ' '
      self.name = nm if nm.present?
    end

    # Generate a preflabel from the name parts. Overwrite the existing preflabel.
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
