# frozen_string_literal: true

module DogBiscuits
  module ArchivalItemMetadata
    extend ActiveSupport::Concern
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
