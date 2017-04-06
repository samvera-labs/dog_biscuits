# frozen_string_literal: true

module DogBiscuits
  # rights
  module CommonRights
    extend ActiveSupport::Concern
    include DogBiscuits::RightsHolder
    include DogBiscuits::EdmRights
    include DogBiscuits::Rights
  end
end
