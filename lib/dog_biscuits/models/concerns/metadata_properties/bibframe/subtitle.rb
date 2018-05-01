# frozen_string_literal: true

module DogBiscuits
  module Subtitle
    extend ActiveSupport::Concern

    included do
      property :subtitle,
               predicate: ::RDF::Vocab::BF2.subtitle do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
