# frozen_string_literal: true

module DogBiscuits
  # current person (not historical)
  class Person < DogBiscuits::Agent
    include DogBiscuits::FoafNameParts
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

    # TODO: review as specific to York local requirements
    def phd
      rdf_type << DogBiscuits::Vocab::PureTerms.PhdStudent
    end

    # Create a preflabel from the name in Family, Given form
    #   if family and given exist, overwrite existing preflabel
    def add_preflabel
      label = family_name if family_name.present?

      if given_name.present?
        if label.nil?
          label = given_name
        else
          label += ", #{given_name}"
        end
      end

      self.preflabel = label if label.present?
    end
  end
end
