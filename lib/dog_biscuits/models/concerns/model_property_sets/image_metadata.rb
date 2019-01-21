# frozen_string_literal: true

module DogBiscuits
  module ImageMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Height
    include DogBiscuits::Width
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
