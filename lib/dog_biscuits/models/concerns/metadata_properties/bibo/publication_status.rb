# frozen_string_literal: true

module DogBiscuits
  module PublicationStatus
    extend ActiveSupport::Concern

    included do
      property :publication_status, predicate: ::RDF::Vocab::BIBO.status,
                                    multiple: false do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
