# frozen_string_literal: true

module DogBiscuits
  # Validate see also references.
  module ValidateConceptRelated
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::ConceptRelatedValidator
    end
  end
end
