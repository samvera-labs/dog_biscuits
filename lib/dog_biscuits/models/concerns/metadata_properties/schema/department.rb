# frozen_string_literal: true

module DogBiscuits
  module Department
    extend ActiveSupport::Concern

    included do
      property :department, predicate: ::RDF::Vocab::SCHEMA.department do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
