# frozen_string_literal: true

module DogBiscuits
  module InProceeding
    extend ActiveSupport::Concern

    included do
      property :proceeding,
               predicate: ::RDF::Vocab::BF2.partOf do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
