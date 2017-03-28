module DogBiscuits
  # validate labels
  module ValidateLabel
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::HasLabelValidator
    end
  end
end
