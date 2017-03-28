module DogBiscuits
  # dog_biscuits fileset
  class FileSet < ActiveFedora::Base
    include Hyrax::FileSetBehavior,
            DogBiscuits::CommonLabels,
            DogBiscuits::CommonRights,
            DogBiscuits::FormerIdentifier,
            DogBiscuits::AddDefaultPermissions,
            DogBiscuits::ContentVersion

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
