# frozen_string_literal: true

module DogBiscuits
  class FileSet < ActiveFedora::Base
    include DogBiscuits::CommonLabels
    include DogBiscuits::CommonRights
    include DogBiscuits::FormerIdentifier
    include DogBiscuits::ContentVersion
    include Hyrax::FileSetBehavior # this needs to go AFTER properties as FileSetBehaviour contains BasicMetadata

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
      true
    end

    def collection?
      false
    end

    def edit_groups
      ['admin']
    end
  end
end
