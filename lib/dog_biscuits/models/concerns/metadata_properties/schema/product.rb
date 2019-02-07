# frozen_string_literal: true

module DogBiscuits
  module Product
    extend ActiveSupport::Concern

    included do
      property :product, predicate: RDF::Vocab::SCHEMA.product do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
