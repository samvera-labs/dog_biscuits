# frozen_string_literal: true

module DogBiscuits
  module ContentVersion
    extend ActiveSupport::Concern

    included do
      property :content_version, predicate: RDF::Vocab::SCHEMA.version do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
