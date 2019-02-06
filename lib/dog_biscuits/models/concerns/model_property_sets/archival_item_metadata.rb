# frozen_string_literal: true

module DogBiscuits
  module ArchivalItemMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::ArchivalLevel
    include DogBiscuits::AccessProvidedBy
    include DogBiscuits::AccessRights
    include DogBiscuits::DateCreated
    include DogBiscuits::Extent
    include DogBiscuits::HubDates

    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
