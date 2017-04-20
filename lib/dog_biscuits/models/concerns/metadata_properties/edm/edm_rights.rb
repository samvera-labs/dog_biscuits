# frozen_string_literal: true

module DogBiscuits
  module EdmRights
    extend ActiveSupport::Concern

    included do
      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights_statement, predicate: ::RDF::Vocab::EDM.rights,
                                  multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
