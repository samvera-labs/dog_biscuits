# frozen_string_literal: true

module DogBiscuits
  module DigitalArchivalObjectMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::AccessProvidedBy
    include DogBiscuits::Extent
    include DogBiscuits::PackagedBy
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
