# frozen_string_literal: true

module DogBiscuits
  class Collection < ActiveFedora::Base
    include ::Hyrax::CollectionBehavior
    include DogBiscuits::CommonMetadata

    def authority?
      false
    end

    def agent?
      false
    end

    def work?
      false
    end

    def file_set?
      false
    end

    def collection?
      true
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
