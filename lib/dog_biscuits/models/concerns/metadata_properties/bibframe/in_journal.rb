# frozen_string_literal: true

module DogBiscuits
  module InJournal
    extend ActiveSupport::Concern

    included do
      property :journal,
               predicate: ::RDF::Vocab::BF2.partOf do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
