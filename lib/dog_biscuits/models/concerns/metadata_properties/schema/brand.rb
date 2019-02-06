# frozen_string_literal: true

module DogBiscuits
  module Brand
    extend ActiveSupport::Concern

    included do
      property :brand, predicate: RDF::Vocab::SCHEMA.brand do |index|
        index.as :stored_searchable
      end
    end
  end
end
