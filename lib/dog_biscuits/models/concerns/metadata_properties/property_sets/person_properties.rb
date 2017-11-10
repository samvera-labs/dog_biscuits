# frozen_string_literal: true

module DogBiscuits
  module PersonProperties
    extend ActiveSupport::Concern

    # A set of properties for Person. These properties are only useful to Person and any classes that inherit from Person.
    included do
      property :prefix, predicate: ::RDF::Vocab::SCHEMA.honorificPrefix,
                        multiple: false do |index|
        index.as :stored_searchable
      end

      # Eg. NCA Rules 2.4.
      property :family_name, predicate: ::RDF::Vocab::FOAF.familyName,
                             multiple: false do |index|
        index.as :stored_searchable
      end

      # Eg. NCA Rules 2.3.
      property :given_name, predicate: ::RDF::Vocab::FOAF.givenName,
                            multiple: false do |index|
        index.as :stored_searchable
      end

      property :suffix,
               predicate: ::RDF::Vocab::SCHEMA.honorificSuffix,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Value should be Date
      property :birth_date,
               predicate: ::RDF::Vocab::SCHEMA.birthDate,
               multiple: false do |index|
        index.type :date
        index.as :stored_searchable
      end

      # Value should be Date
      property :death_date,
               predicate: ::RDF::Vocab::SCHEMA.deathDate,
               multiple: false do |index|
        index.type :date
        index.as :stored_searchable
      end

      # Value should be edm:Place
      property :birth_place,
               predicate: ::RDF::Vocab::SCHEMA.birthPlace,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Value should be edm:Place
      property :death_place,
               predicate: ::RDF::Vocab::SCHEMA.deathPlace,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :nationality,
               predicate: ::RDF::Vocab::SCHEMA.nationality,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :gender,
               predicate: ::RDF::Vocab::FOAF.gender,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Value should be foaf:Person
      property :knows,
               predicate: ::RDF::Vocab::FOAF.knows do |index|
        index.as :stored_searchable
      end

      # Value should be foaf:Organization
      property :affiliation,
               predicate: ::RDF::Vocab::SCHEMA.affiliation do |index|
        index.as :stored_searchable
      end

      # Value should be foaf:Group
      property :member_of, predicate: ::RDF::Vocab::SCHEMA.memberOf do |index|
        index.as :stored_searchable
      end
    end
  end
end
