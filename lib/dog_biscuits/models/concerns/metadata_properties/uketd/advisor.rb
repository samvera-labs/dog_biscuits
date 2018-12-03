# frozen_string_literal: true

module DogBiscuits
  module Advisor
    extend ActiveSupport::Concern

    included do
      # alternative (local) predicate DogBiscuits::Vocab::Uketd.advisor
      property :advisor, predicate: DogBiscuits::Vocab::Uketd.advisor do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
