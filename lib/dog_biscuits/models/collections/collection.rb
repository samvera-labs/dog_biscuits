# frozen_string_literal: true

module DogBiscuits
  class Collection < ActiveFedora::Base
    include DogBiscuits::CommonMetadata
    include ::Hyrax::CollectionBehavior

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

    def edit_groups
      ['admin']
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
