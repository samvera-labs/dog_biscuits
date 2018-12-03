# frozen_string_literal: true

module DogBiscuits
  module Contributor
    extend ActiveSupport::Concern

    included do
      # alternative predicate ::RDF::Vocab::MARCRelators.ctb
      property :contributor, predicate: ::RDF::Vocab::DC11.contributor do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
