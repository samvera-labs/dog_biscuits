# frozen_string_literal: true

module DogBiscuits
  module PresentedAt
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :presented_at_resource,
                              class_name: 'DogBiscuits::Authority', # TODO: model event
                              predicate: ::RDF::Vocab::BIBO.presentedAt
    end
  end
end
