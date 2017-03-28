module DogBiscuits
  class ConceptSchemeMemberValidator
    def self.validate!(_association, record)
      if !record.try(:person?) && !record.try(:place?) && !record.try(:group?) && !record.try(:concept?)
        raise ActiveFedora::AssociationTypeMismatch, "#{record} may not be a member of a concept scheme"
      end
    end
  end
end
