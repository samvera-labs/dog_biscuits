# frozen_string_literal: true

module DogBiscuits
  # Dump field for indexing. Probably not the best approach.
  module ForIndexing
    extend ActiveSupport::Concern

    included do
      property :for_indexing, predicate: DogBiscuits::Vocab::Generic.forIndexing,
                              multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
