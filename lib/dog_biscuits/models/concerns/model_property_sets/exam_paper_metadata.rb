# frozen_string_literal: true

module DogBiscuits
  # add exam paper metadata
  module ExamPaperMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::ModuleCode
    include DogBiscuits::MainFile
    include DogBiscuits::Qualification
    include DogBiscuits::DateAvailable
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
