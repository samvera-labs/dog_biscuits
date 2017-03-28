module DogBiscuits
  # add thesis metadata
  module AddThesisMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::CommonMetadata,
            DogBiscuits::Abstract,
            DogBiscuits::Doi,
            DogBiscuits::Orcid,
            DogBiscuits::MainFile,
            DogBiscuits::Department,
            DogBiscuits::Qualification,
            DogBiscuits::Advisor,
            DogBiscuits::AwardingInstitution,
            DogBiscuits::DateOfAward
  end
end
