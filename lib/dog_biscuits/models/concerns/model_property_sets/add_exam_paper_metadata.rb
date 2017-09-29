# frozen_string_literal: true

module DogBiscuits
  # add exam paper metadata
  module AddExamPaperMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::GenericModuleCode
    include DogBiscuits::MainFile
    include DogBiscuits::Qualification
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
