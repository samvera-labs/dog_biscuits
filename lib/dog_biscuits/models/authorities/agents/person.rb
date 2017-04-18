# frozen_string_literal: true

module DogBiscuits
  # current person (not historical)
  class Person < DogBiscuits::Agent
    include DogBiscuits::FoafNameParts
    include DogBiscuits::HubDates
    include DogBiscuits::Pure
    include DogBiscuits::RdfType
    include DogBiscuits::Orcid

    before_save :add_pure_type, :add_preflabel

    type [::RDF::URI.new('http://schema.org/Person'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person]

    # TODO: review as specific to York local requirements
    def add_pure_type
      rdf_type << DogBiscuits::Vocab::PureTerms.Person unless pure_uuid.nil?
    end

    def person?
      true
    end

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

    # TODO: review as specific to York local requirements TEST
    def phd
      rdf_type << DogBiscuits::Vocab::PureTerms.PhdStudent
    end

    # Generate a preflabel from the name parts. Overwrite the existing preflabel.
    def add_preflabel
      label = ''
      label += ", #{family_name}" if family_name.present?
      label += ", #{given_name}" if given_name.present?
      label += ", #{dates}" if dates.present?
      label = label.sub(', ', '') if label.starts_with? ', '
      self.preflabel = label
    end
  end
end
