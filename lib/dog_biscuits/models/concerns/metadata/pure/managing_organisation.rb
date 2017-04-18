# frozen_string_literal: true

module DogBiscuits
  # PURE metadata
  module ManagingOrganisation
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :managing_organisation_resource,
                              class_name: 'DogBiscuits::Organisation',
                              predicate:
                                  DogBiscuits::Vocab::PureTerms.pureManagingUnit
    end
  end
end
