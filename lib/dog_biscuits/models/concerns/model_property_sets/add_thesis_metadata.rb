# frozen_string_literal: true

module DogBiscuits
  module AddThesisMetadata
    extend ActiveSupport::Concern
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
