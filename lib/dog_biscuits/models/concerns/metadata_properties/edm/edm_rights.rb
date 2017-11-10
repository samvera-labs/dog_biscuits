# frozen_string_literal: true

module DogBiscuits
  module EdmRights
    extend ActiveSupport::Concern

    included do
      property :rights_statement, predicate: ::RDF::Vocab::EDM.rights do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
