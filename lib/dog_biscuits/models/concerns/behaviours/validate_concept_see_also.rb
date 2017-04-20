# frozen_string_literal: true

module DogBiscuits
  # Validate see also references.
  module ValidateConceptSeeAlso
    extend ActiveSupport::Concern

    included do
      validates_with DogBiscuits::ConceptSeeAlsoValidator
    end
  end
end
