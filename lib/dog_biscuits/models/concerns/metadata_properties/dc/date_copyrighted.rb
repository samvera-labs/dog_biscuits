# frozen_string_literal: true

module DogBiscuits
  module DateCopyrighted
    extend ActiveSupport::Concern

    included do
      property :date_copyrighted, predicate: ::RDF::Vocab::DC.dateCopyrighted do |index|
        index.type :date
        index.as :stored_searchable, :facetable, :stored_sortable
      end
    end
  end
end
