# frozen_string_literal: true

module DogBiscuits
  module DateCollected
    extend ActiveSupport::Concern

    included do
      property :date_collected,
               predicate: ::RDF::URI.new('http://purl.org/spar/fabio/hasDateCollected') do |index|
        index.as :stored_searchable, :facetable, :stored_sortable, :sortable
        index.type :date
      end
    end
  end
end
