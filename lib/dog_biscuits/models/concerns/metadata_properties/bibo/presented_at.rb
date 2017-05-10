# frozen_string_literal: true

module DogBiscuits
  module PresentedAt
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :presented_at_resource,
                              class_name: 'DogBiscuits::Authority', # TODO: model event
                              predicate: ::RDF::Vocab::BIBO.presentedAt

      # TODO review this
      property :presented_at, predicate: ::RDF::Vocab::BIBO.presentedAt,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
