# frozen_string_literal: true

module DogBiscuits
  module CountryCode
    extend ActiveSupport::Concern

    included do
      property :country_code,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/countryCode'),
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
