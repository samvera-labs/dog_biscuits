# frozen_string_literal: true

module DogBiscuits
  module DateOfAward
    extend ActiveSupport::Concern

    included do
      property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted do |index|
        index.as :stored_searchable, :facetable, :stored_sortable
      end
    end
  end
end
