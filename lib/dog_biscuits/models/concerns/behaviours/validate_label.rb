# frozen_string_literal: true

module DogBiscuits
  # validate labels
  module ValidateLabel
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::LabelValidator
    end
  end
end
