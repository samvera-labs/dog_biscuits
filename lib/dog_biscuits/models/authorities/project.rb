# frozen_string_literal: true

module DogBiscuits
  # Project
  class Project < Authority
    include DogBiscuits::CommonLabels
    include DogBiscuits::FoafName
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::Identifier
    include DogBiscuits::Funder
    include Hyrax::Noid

    before_save :add_preflabel

    type [::RDF::URI.new('http://xmlns.com/foaf/0.1/Project')]

    def project?
      true
    end

    def concept?
      false
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

    def group?
      false
    end

    def place?
      false
    end

    def add_preflabel
      self.preflabel = name if name.present?
      self.preflabel += " (id: #{identifier.join})" if identifier.present?
    end
  end
end
