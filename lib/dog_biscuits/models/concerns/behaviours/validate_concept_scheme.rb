# frozen_string_literal: true

module DogBiscuits
  # validate a concept scheme
  module ValidateConceptScheme
    extend ActiveSupport::Concern

    included do
      def self.type_validator
        Hydra::PCDM::Validators::CompositeValidator.new(
          DogBiscuits::ConceptSchemeMemberValidator
        )
      end
    end
  end
end
