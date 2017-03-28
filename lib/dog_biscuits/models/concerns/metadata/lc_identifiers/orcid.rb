module DogBiscuits
  # orcid
  module Orcid
    extend ActiveSupport::Concern

    included do
      property :orcid, predicate: ::RDF::Vocab::Identifiers.orcid,
                       multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
