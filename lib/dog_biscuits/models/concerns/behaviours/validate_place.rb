# frozen_string_literal: true

module DogBiscuits
  # validate place
  module ValidatePlace
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::PlaceValidator
    end
  end
end
