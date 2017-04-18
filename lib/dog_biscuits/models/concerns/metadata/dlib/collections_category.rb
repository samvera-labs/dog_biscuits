# frozen_string_literal: true

module DogBiscuits
  # collections category
  module CollectionsCategory
    extend ActiveSupport::Concern

    included do
      property :collections_category, predicate: DogBiscuits::Vocab::Generic.collectionsCategory,
                                      multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
