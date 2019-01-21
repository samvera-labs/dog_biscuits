# frozen_string_literal: true

module DogBiscuits
  module InformationResourceMetadata
    extend ActiveSupport::Concern
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
