# frozen_string_literal: true

module DogBiscuits
  class ConceptSchemeMemberValidator
    def self.validate!(_association, record)
      # Only authorities can be members of a concept scheme.
      raise ActiveFedora::AssociationTypeMismatch, "#{record} may not be a member of a concept scheme" unless record.try(:authority?)
    end
  end
end
