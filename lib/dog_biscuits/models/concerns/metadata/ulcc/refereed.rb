# frozen_string_literal: true

module DogBiscuits
  # refereed
  module Refereed
    extend ActiveSupport::Concern

    included do
      property :refereed, predicate: DogBiscuits::Vocab::UlccTerms.refereed,
                          multiple: false do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
