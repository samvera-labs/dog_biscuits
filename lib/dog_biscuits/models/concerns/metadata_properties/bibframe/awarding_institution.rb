# frozen_string_literal: true

module DogBiscuits
  module AwardingInstitution
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :awarding_institution_resource,
                              class_name: 'DogBiscuits::Organisation',
                              predicate: ::RDF::Vocab::BF2.grantingInstitution
    end
  end
end
