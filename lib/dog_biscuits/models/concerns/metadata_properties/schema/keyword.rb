# frozen_string_literal: true

module DogBiscuits
  module Keyword
    extend ActiveSupport::Concern

    included do
      property :keyword, predicate: ::RDF::Vocab::SCHEMA.keywords do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
