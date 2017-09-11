# frozen_string_literal: true

module DogBiscuits
  module Refereed
    extend ActiveSupport::Concern

    included do
      property :refereed, predicate: DogBiscuits::Vocab::UlccTerms.refereed do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
