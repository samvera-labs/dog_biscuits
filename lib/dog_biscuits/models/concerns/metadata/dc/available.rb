# frozen_string_literal: true

module DogBiscuits
  # DC date available
  module Available
    extend ActiveSupport::Concern

    included do
      property :date_available, predicate: ::RDF::Vocab::DC.available,
                                multiple: false do |index|
        # index.type :date
        index.as :stored_searchable, :facetable, :dateable, :sortable
      end
    end
  end
end
