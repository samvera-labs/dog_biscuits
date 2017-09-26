# frozen_string_literal: true

module DogBiscuits
  class CollectionIndexer < Hyrax::CollectionIndexer
    include DogBiscuits::IndexesCollection
  end
end
