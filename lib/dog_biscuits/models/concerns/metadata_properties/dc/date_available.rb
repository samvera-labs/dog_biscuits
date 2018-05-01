# frozen_string_literal: true

module DogBiscuits
  module DateAvailable
    extend ActiveSupport::Concern

    included do
      property :date_available, predicate: ::RDF::Vocab::DC.available do |index|
        index.type :date
        index.as :stored_searchable, :facetable, :dateable, :sortable
      end
    end
  end
end
