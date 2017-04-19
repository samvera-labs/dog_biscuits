# frozen_string_literal: true

module DogBiscuits
  module AddPlaceProperties
    extend ActiveSupport::Concern

    included do
      # value from http://unlock.edina.ac.uk/ws/supportedFeatureTypes?&gazetteer=deep&format=json
      # value from http://www.geonames.org/statistics/total.html
      property :feature_code,
               predicate: ::RDF::URI.new('http://www.geonames.org/ontology#featureCode'),
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

      property :parent_feature,
               predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentFeature'),
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :country_code,
               predicate: ::RDF::URI.new('http://www.geonames.org/ontology#countryCode'),
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :lat,
               predicate: RDF::Vocab::GEO.lat,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :long,
               predicate: RDF::Vocab::GEO.long,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :alt,
               predicate: RDF::Vocab::GEO.alt,
               multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
