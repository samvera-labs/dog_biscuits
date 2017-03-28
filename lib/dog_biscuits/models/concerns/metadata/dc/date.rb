module DogBiscuits
  # DC date
  module Date
    extend ActiveSupport::Concern

    included do
      property :date, predicate: ::RDF::Vocab::DC.date,
                      multiple: true do |index|
        index.as :stored_searchable, :facetable, :dateable
      end
    end
  end
end
