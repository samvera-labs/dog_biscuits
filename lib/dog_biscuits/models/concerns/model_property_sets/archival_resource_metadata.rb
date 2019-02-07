# frozen_string_literal: true

module DogBiscuits
  module ArchivalResourceMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::ArchivalLevel
    include DogBiscuits::AccessProvidedBy
    include DogBiscuits::AccessRestrictions
    include DogBiscuits::Brand
    include DogBiscuits::DateCreated
    include DogBiscuits::Extent
    include DogBiscuits::HubDates

    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
