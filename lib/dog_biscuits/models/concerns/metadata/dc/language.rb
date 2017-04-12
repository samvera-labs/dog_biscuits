# frozen_string_literal: true

module DogBiscuits
  # DC language
  module Language
    extend ActiveSupport::Concern

    included do
      property :language_code, predicate: ::RDF::Vocab::DC.language,
                               multiple: true do |index|
        index.as :stored_searchable
      end

      property :language, predicate: ::RDF::Vocab::DC11.language,
                          multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
