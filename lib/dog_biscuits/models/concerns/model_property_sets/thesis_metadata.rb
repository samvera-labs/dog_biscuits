# frozen_string_literal: true

module DogBiscuits
  module ThesisMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Abstract
    include DogBiscuits::Advisor
    include DogBiscuits::AwardingInstitution
    include DogBiscuits::DateOfAward
    include DogBiscuits::Department
    include DogBiscuits::MainFile
    include DogBiscuits::Orcid
    include DogBiscuits::Qualification
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
