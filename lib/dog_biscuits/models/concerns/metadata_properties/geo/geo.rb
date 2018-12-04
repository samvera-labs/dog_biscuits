# frozen_string_literal: true

module DogBiscuits
  module Geo
    extend ActiveSupport::Concern

    included do
      property :lat,
               predicate: RDF::Vocab::GEO.lat,
               multiple: true do |index|
        index.as :stored_searchable
      end

      property :long,
               predicate: RDF::Vocab::GEO.long,
               multiple: true do |index|
        index.as :stored_searchable
      end

      property :alt,
               predicate: RDF::Vocab::GEO.alt,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
