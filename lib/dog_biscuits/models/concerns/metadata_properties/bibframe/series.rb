# frozen_string_literal: true

module DogBiscuits
  module Series
    extend ActiveSupport::Concern

    included do
      property :series, predicate: ::RDF::Vocab::BF2.hasSeries,
                        multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
