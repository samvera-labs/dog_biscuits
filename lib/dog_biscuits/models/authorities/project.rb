# frozen_string_literal: true

module DogBiscuits
  class Project < Authority
    include DogBiscuits::FoafName
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::Identifier
    include DogBiscuits::Funder
    include Hyrax::Noid

    before_save :add_label

    type [::RDF::URI.new('http://xmlns.com/foaf/0.1/Project')]

    def agent?
      false
    end

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
      false
    end

    def place?
      false
    end

    def project?
      true
    end

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      self.rdfs_label = name if name.present?
      self.rdfs_label += " (id: #{identifier.join})" if identifier.present?
      add_preflabel
    end

    # Generate a preflabel from rdfs label.
    def add_preflabel
      self.preflabel = rdfs_label
    end
  end
end
