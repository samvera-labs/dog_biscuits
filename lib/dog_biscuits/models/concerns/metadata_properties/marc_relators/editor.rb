# frozen_string_literal: true

module DogBiscuits
  module Editor
    extend ActiveSupport::Concern

    included do
      # alternative predicate ::RDF::Vocab::BIBO.editor
      property :editor, predicate: ::RDF::Vocab::MARCRelators.edc do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
