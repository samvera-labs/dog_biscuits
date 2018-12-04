# frozen_string_literal: true

module DogBiscuits
  module Funder
    extend ActiveSupport::Concern

    included do
      property :funder, predicate: ::RDF::Vocab::MARCRelators.fnd do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
