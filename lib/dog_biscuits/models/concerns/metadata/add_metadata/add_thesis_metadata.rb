# frozen_string_literal: true

module DogBiscuits
  # add thesis metadata
  module AddThesisMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata
    include DogBiscuits::Abstract
    include DogBiscuits::Doi
    include DogBiscuits::Orcid
    include DogBiscuits::MainFile
    include DogBiscuits::Department
    include DogBiscuits::Qualification
    include DogBiscuits::Advisor
    include DogBiscuits::AwardingInstitution
    include DogBiscuits::DateOfAward
  end
end
