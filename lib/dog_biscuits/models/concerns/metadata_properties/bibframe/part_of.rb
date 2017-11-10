# frozen_string_literal: true

module DogBiscuits
  module PartOf
    extend ActiveSupport::Concern

    included do
      property :part_of,
               predicate: ::RDF::Vocab::BF2.partOf do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
