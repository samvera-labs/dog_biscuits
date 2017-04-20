# frozen_string_literal: true

module DogBiscuits
  module AddPlaceProperties
    extend ActiveSupport::Concern

    # A set of properties for Place. These properties are only useful to Place and any classes that inherit from Place.
    included do
      # Suggest using values from:
      #   http://unlock.edina.ac.uk/ws/supportedFeatureTypes?&gazetteer=deep&format=json
      #   http://www.geonames.org/statistics/total.html
      property :feature_code,
               predicate: ::RDF::Vocab::GEONAMES.featureCode,
               multiple: true do |index|
        index.as :stored_searchable
      end

      # eg. NCARules name.
      property :place_name,
               predicate: ::RDF::Vocab::GEONAMES.name,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # eg. NCARules civil parish.
      property :parent_ADM4,
               predicate: ::RDF::Vocab::GEONAMES.parentADM4,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Eg. NCARules local administrative unit.
      property :parent_ADM3,
               predicate: ::RDF::Vocab::GEONAMES.parentADM3,
               multiple: false do |index|
        index.as :stored_searchable
      end
      # Eg. NCARules county/wider administrative unit.
      property :parent_ADM2,
               predicate: ::RDF::Vocab::GEONAMES.parentADM2,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Eg. NCARules country (England).
      property :parent_ADM1,
               predicate: ::RDF::Vocab::GEONAMES.parentADM1,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :parent_country,
               predicate: ::RDF::Vocab::GEONAMES.parentCountry,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :parent_feature,
               predicate: ::RDF::Vocab::GEONAMES.parentFeature,
               multiple: false do |index|
        index.as :stored_searchable
      end

      property :country_code,
               predicate: ::RDF::Vocab::GEONAMES.countryCode,
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
