# frozen_string_literal: true

module DogBiscuits
  # agents, people and organisations extend this
  class Agent < Authority
    include DogBiscuits::OwlSameAs
    include DogBiscuits::CommonLabels
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::MadsRelatedAuthority
    include Hyrax::Noid

    def agent?
      true
    end
  end
end
