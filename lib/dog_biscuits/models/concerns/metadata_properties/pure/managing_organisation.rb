# frozen_string_literal: true

module DogBiscuits
  module ManagingOrganisation
    extend ActiveSupport::Concern

    included do
      property :managing_organisation,
               predicate: DogBiscuits::Vocab::PureTerms.pureManagingUnit do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
