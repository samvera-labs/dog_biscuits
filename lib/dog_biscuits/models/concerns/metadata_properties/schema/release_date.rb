# frozen_string_literal: true

module DogBiscuits
  module ReleaseDate
    extend ActiveSupport::Concern

    included do
      property :release_date, predicate: RDF::Vocab::SCHEMA.releaseDate do |index|
        index.as :stored_searchable, :facetable, :stored_sortable
      end
    end
  end
end
