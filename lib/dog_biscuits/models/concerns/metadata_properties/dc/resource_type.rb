# frozen_string_literal: true

module DogBiscuits
  module ResourceType
    extend ActiveSupport::Concern

    included do
      property :resource_type, predicate: ::RDF::Vocab::DC.type do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
