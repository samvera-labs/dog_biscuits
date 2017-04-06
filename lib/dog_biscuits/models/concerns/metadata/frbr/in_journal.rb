# frozen_string_literal: true

module DogBiscuits
  # Journal metadata
  module InJournal
    extend ActiveSupport::Concern

    included do
      property :journal,
               predicate: ::RDF::URI.new('https://vocab.org/frbr/core#partOf'),
               multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
