# frozen_string_literal: true

module DogBiscuits
  # Validates that there is a place name
  class PlaceValidator < ActiveModel::Validator
    def validate(record)
      record.errors[:place_name] << 'You must provide a place name' if record.place_name.blank?
    end
  end
end
