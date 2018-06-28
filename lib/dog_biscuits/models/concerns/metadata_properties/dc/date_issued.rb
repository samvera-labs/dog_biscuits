# frozen_string_literal: true

module DogBiscuits
  module DateIssued
    extend ActiveSupport::Concern

    included do
      property :date_issued, predicate: ::RDF::Vocab::DC.issued do |index|
        index.type :date
        index.as :stored_searchable, :facetable, :dateable
      end
    end
  end
end
