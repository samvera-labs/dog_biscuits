# frozen_string_literal: true

module DogBiscuits
  module Pagination
    extend ActiveSupport::Concern

    included do
      property :pagination, predicate: RDF::Vocab::SCHEMA.pagination do |index|
        index.as :stored_searchable
      end
    end
  end
end
