# frozen_string_literal: true

module DogBiscuits
  module DigitalArchivalObjectMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::PartOf
    include DogBiscuits::AccessProvidedBy
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
