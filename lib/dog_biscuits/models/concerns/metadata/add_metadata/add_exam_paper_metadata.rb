module DogBiscuits
  # add exam paper metadata
  module AddExamPaperMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata,
            DogBiscuits::GenericModuleCode,
            DogBiscuits::MainFile,
            DogBiscuits::Qualification

  end
end
