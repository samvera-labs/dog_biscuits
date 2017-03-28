module DogBiscuits
  # rights
  module CommonRights
    extend ActiveSupport::Concern
    include DogBiscuits::RightsHolder,
            DogBiscuits::EdmRights,
            DogBiscuits::Rights
  end
end
