module DogBiscuits
  # refereed
  module ProjectOutput
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :project_resource,
                              class_name: 'DogBiscuits::Project',
                              predicate:
                                  DogBiscuits::Vocab::UlccTerms.outputOf
    end
  end
end