module DogBiscuits
  class Work < ActiveFedora::Base
    include DogBiscuits::AddWorkBehaviour,
            DogBiscuits::AddDefaultPermissions

    has_and_belongs_to_many :packaged_by,
                            class_name: 'DogBiscuits::Package',
                            predicate: DogBiscuits::Vocab::Generic.packagedBy,
                            inverse_of: :packages

    def authority?
      false
    end
    def agent?
      false
    end
    def work?
      true
    end
    def file_set?
      false
    end
    def collection?
      false
    end

    def edit_groups
      ['admin']
    end

  end
end