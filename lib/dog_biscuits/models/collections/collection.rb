# frozen_string_literal: true

module DogBiscuits
  class Collection < ActiveFedora::Base
    include ::Hyrax::CollectionBehavior
    include DogBiscuits::CommonMetadata
    include DogBiscuits::AddDefaultPermissions

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

    # don't know what this is for but I got an error in my tests without it
    def suppressed?
      false
    end

    class CollectionIndexer < Hyrax::CollectionIndexer # Hydra::PCDM::PCDMIndexer
      include DogBiscuits::IndexesCollection
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
