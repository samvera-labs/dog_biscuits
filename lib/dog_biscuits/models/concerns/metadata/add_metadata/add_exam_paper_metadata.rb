# frozen_string_literal: true

module DogBiscuits
  # add exam paper metadata
  module AddExamPaperMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata
    include DogBiscuits::GenericModuleCode
    include DogBiscuits::MainFile
    include DogBiscuits::Qualification
  end
end
