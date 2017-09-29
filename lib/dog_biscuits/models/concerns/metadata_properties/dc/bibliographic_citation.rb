# frozen_string_literal: true

module DogBiscuits
  module BibliographicCitation
    extend ActiveSupport::Concern

    included do
      property :bibliographic_citation, predicate: ::RDF::Vocab::DC.bibliographicCitation do |index|
        index.as :stored_searchable
      end
    end
  end
end
