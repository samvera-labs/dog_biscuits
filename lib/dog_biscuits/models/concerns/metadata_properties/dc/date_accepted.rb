# frozen_string_literal: true

module DogBiscuits
  module DateAccepted
    extend ActiveSupport::Concern

    included do
      property :date_accepted, predicate: ::RDF::Vocab::DC.dateAccepted,
                               multiple: false do |index|
        index.as :stored_searchable, :facetable, :dateable
      end
    end
  end
end
