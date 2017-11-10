# frozen_string_literal: true

module DogBiscuits
  module PresentedAt
    extend ActiveSupport::Concern

    included do
      # TODO: Event
      has_and_belongs_to_many :presented_at_resource,
                              class_name: DogBiscuits::Authority,
                              predicate: ::RDF::Vocab::BIBO.presentedAt

      property :presented_at, predicate: DogBiscuits::Vocab::UlccTerms.presentedAtConference do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
