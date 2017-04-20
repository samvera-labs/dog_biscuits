# frozen_string_literal: true

module DogBiscuits
  # Validate place name.
  module ValidatePlace
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::PlaceValidator
    end
  end
end
