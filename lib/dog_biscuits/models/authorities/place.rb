# frozen_string_literal: true

module DogBiscuits
  # place
  class Place < Authority
    include DogBiscuits::OwlSameAs
    include DogBiscuits::BorthwickNote
    include DogBiscuits::MadsRelatedAuthority
    include DogBiscuits::GenericAuthorityTerms
    include Hyrax::Noid
    include DogBiscuits::ValidatePlace

    before_save :add_preflabel

    # TODO: Alternative approach to parent_ADMx needs more work
    # See also GVP CLASS AdminPlaceConcept or PhysPlaceConcept
    # has_and_belongs_to_many :contained_in_place,
    #                         class_name: 'DogBiscuits::Place',
    #                         predicate: ::RDF::URI.new('https://schema.org/containedInPlace'),
    #                         inverse_of: :contains_place
    # has_and_belongs_to_many :contains_place,
    #                         class_name: 'DogBiscuits::Place',
    #                         predicate: ::RDF::URI.new('https://schema.org/containsPlace'),
    #                         inverse_of: :contained_in_place

    type [::RDF::URI.new('http://schema.org/Place'),
          ::RDF::URI.new('http://purl.org/vra/Place')]

    # Consider VRA subclasses of Place (added into feature codes property as metadata rather than as Classes here)
    # http://purl.org/vra/CivicStructure
    # http://purl.org/vra/Continent
    # http://purl.org/vra/AdministrativeArea s
    #   subclasses http://purl.org/vra/State, http://purl.org/vra/City

    # use http://unlock.edina.ac.uk/ws/supportedFeatureTypes?&gazetteer=deep&format=json
    property :feature_code,
             predicate: DogBiscuits::Vocab::BorthwickRegisters.featureType,
             multiple: true do |index|
      index.as :stored_searchable
    end

    # eg. NCARules name.
    property :place_name,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#name'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCARules civil parish.
    property :parent_ADM4,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM4'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCARules local administrative unit.
    property :parent_ADM3,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM3'),
             multiple: false do |index|
      index.as :stored_searchable
    end
    # Eg. NCARules county/wider administrative unit.
    property :parent_ADM2,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM2'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCARules country (England).
    property :parent_ADM1,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM1'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. UK.
    property :parent_country,
             predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentCountry'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    def place?
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

    def group?
      false
    end

    def add_preflabel
      label = place_name.to_s
      label += ", #{parent_ADM4}" if parent_ADM4.present?
      label += ", #{parent_ADM3}" if parent_ADM3.present?
      label += ", #{parent_ADM2}" if parent_ADM2.present?
      label += ", #{parent_ADM1}" if parent_ADM1.present?
      label += ", #{parent_country}" if parent_country.present?

      self.preflabel = label
    end
  end
end
