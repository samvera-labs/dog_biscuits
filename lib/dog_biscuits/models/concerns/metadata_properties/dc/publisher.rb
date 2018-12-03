# frozen_string_literal: true

module DogBiscuits
  module Publisher
    extend ActiveSupport::Concern

    included do
      # alternative predicate ::RDF::Vocab::MARCRelators.pbl
      property :publisher, predicate: ::RDF::Vocab::DC11.publisher do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
