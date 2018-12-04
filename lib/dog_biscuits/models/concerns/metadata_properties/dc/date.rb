# frozen_string_literal: true

module DogBiscuits
  module Date
    extend ActiveSupport::Concern

    included do
      property :date, predicate: ::RDF::Vocab::DC.date do |index|
        index.as :stored_searchable, :facetable, :stored_sortable
      end
    end
  end
end
