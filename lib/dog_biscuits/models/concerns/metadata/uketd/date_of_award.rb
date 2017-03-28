module DogBiscuits
  # thesis metadata
  module DateOfAward
    extend ActiveSupport::Concern

    included do

      property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false do |index|
        index.as :stored_searchable, :facetable, :dateable
      end

    end
  end
end
