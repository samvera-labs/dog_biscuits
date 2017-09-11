# frozen_string_literal: true

module DogBiscuits
  module OriginDate
    extend ActiveSupport::Concern

    included do
      property :origin_date, predicate: ::RDF::Vocab::BF2.originDate do |index|
        index.type :date
        index.as :stored_searchable
      end
    end
  end
end
