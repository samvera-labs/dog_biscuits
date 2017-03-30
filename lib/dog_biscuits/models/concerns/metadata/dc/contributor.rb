module DogBiscuits
  # DC creator
  module Creator
    extend ActiveSupport::Concern

    included do
      property :contributor, predicate: ::RDF::Vocab::DC11.contributor,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
