# frozen_string_literal: true

module DogBiscuits
  module PresentedAt
    extend ActiveSupport::Concern

    included do
      property :presented_at, predicate: ::RDF::Vocab::BIBO.presentedAt do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
