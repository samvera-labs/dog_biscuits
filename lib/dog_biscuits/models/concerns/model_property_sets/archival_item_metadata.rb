# frozen_string_literal: true

module DogBiscuits
  module ArchivalItemMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::AccessProvidedBy
    include DogBiscuits::AccessRights
    include DogBiscuits::Exent
    include DogBiscuits::HubDates

    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
