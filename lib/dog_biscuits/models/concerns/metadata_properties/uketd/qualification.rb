# frozen_string_literal: true

module DogBiscuits
  module Qualification
    extend ActiveSupport::Concern

    included do
      property :qualification_name, predicate: DogBiscuits::Vocab::Uketd.qualificationName, multiple: true do |index|
        index.as :stored_searchable, :facetable
      end

      property :qualification_level, predicate: DogBiscuits::Vocab::Uketd.qualificationLevel, multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
