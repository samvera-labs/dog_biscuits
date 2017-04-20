# frozen_string_literal: true

module DogBiscuits
  module IdentifiedBy
    extend ActiveSupport::Concern

    included do
      # Value should be bf:Identifier
      property :identified_by, predicate: ::RDF::Vocab::BF2.identifiedBy,
                               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
