# frozen_string_literal: true

module DogBiscuits
  module MadsRelatedAuthority
    extend ActiveSupport::Concern

    included do
      property :related_authority,
               predicate: ::RDF::Vocab::MADS.hasRelatedAuthority,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
