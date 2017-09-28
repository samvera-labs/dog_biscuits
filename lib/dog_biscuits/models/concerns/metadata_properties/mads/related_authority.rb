# frozen_string_literal: true

module DogBiscuits
  module RelatedAuthority
    extend ActiveSupport::Concern

    included do
      property :related_authority,
               predicate: ::RDF::Vocab::MADS.hasRelatedAuthority do |index|
        index.as :stored_searchable
      end
    end
  end
end
