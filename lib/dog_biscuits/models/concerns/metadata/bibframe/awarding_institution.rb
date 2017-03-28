module DogBiscuits
  # thesis metadata
  module AwardingInstitution
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :awarding_institution_resource,
                              class_name: 'DogBiscuits::CurrentOrganisation',
                              predicate: ::RDF::Vocab::Bibframe.dissertationInstitution

    end
  end
end
