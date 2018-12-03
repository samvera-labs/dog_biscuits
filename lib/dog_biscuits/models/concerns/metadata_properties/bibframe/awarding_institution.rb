# frozen_string_literal: true

module DogBiscuits
  module AwardingInstitution
    extend ActiveSupport::Concern

    included do
      property :awarding_institution, predicate: ::RDF::Vocab::BF2.grantingInstitution.fnd do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
