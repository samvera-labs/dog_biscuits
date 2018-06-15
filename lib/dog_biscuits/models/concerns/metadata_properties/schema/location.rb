# frozen_string_literal: true

module DogBiscuits
  module Location
    extend ActiveSupport::Concern

    included do
      property :location, predicate: ::RDF::Vocab::SCHEMA.location do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
