# frozen_string_literal: true

module DogBiscuits
  module DateSubmitted
    extend ActiveSupport::Concern

    included do
      # ::RDF::Vocab::DC.dateSubmitted is used by hyrax for date_uploaded
      property :date_submitted, predicate: DogBiscuits::Vocab::UlccTerms.dateSubmitted,
                                multiple: false do |index|
        index.as :stored_searchable, :facetable, :dateable
      end
    end
  end
end
