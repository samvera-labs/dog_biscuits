# frozen_string_literal: true

module DogBiscuits
  module DateUpdated
    extend ActiveSupport::Concern

    included do
      property :date_updated, predicate: RDF::Vocab::SCHEMA.dateModified do |index|
        index.as :stored_searchable, :facetable, :dateable
      end
    end
  end
end
