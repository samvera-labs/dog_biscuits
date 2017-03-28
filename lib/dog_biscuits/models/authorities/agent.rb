module DogBiscuits
  # agents, people and organisations extend this
  class Agent < Authority
    include DogBiscuits::OwlSameAs,
            DogBiscuits::CommonLabels,
            DogBiscuits::GenericAuthorityTerms,
            DogBiscuits::MadsRelatedAuthority,
            Hyrax::Noid

    def agent?
      true
    end
  end
end
