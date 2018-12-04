# frozen_string_literal: true

module DogBiscuits
  module Creator
    extend ActiveSupport::Concern

    included do
      # alternative predicate ::RDF::Vocab::MARCRelators.cre
      property :creator, predicate: ::RDF::Vocab::DC11.creator do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
