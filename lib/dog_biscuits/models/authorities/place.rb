# frozen_string_literal: true

module DogBiscuits
  class Place < Authority
    include DogBiscuits::PlaceProperties
    include DogBiscuits::OwlSameAs
    include DogBiscuits::RelatedAuthority
    include DogBiscuits::GenericAuthorityTerms

    include DogBiscuits::ValidatePlace

    # Possible alternative approach to parent_ADMx
    # has_and_belongs_to_many :contained_in_place,
    #                         class_name: 'DogBiscuits::Place',
    #                         predicate: ::RDF::URI.new('https://schema.org/containedInPlace'),
    #                         inverse_of: :contains_place
    # has_and_belongs_to_many :contains_place,
    #                         class_name: 'DogBiscuits::Place',
    #                         predicate: ::RDF::URI.new('https://schema.org/containsPlace'),
    #                         inverse_of: :contained_in_place

    type [::RDF::Vocab::SCHEMA.Place,
          ::RDF::Vocab::EDM.Place]

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
      true
    end

    def project?
      false
    end

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      label = place_name
      label = add_adm_parts(label)
      label += ", #{parent_country}" if parent_country.present?
      self.rdfs_label = label
      add_preflabel
    end

    # Generate a parent parts.
    def add_adm_parts(label)
      label += ", #{parent_ADM4}" if parent_ADM4.present?
      label += ", #{parent_ADM3}" if parent_ADM3.present?
      label += ", #{parent_ADM2}" if parent_ADM2.present?
      label += ", #{parent_ADM1}" if parent_ADM1.present?
      label
    end

    # Generate a preflabel from rdfs label.
    def add_preflabel
      self.preflabel = rdfs_label
    end
  end
end
