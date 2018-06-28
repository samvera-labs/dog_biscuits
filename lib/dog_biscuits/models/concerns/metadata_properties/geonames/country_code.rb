# frozen_string_literal: true

module DogBiscuits
  module CountryCode
    extend ActiveSupport::Concern

    included do
      property :country_code,
               predicate: ::RDF::Vocab::GEONAMES.countryCode,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
