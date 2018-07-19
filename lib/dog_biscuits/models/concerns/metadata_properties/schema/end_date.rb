# frozen_string_literal: true

module DogBiscuits
  module EndDate
    extend ActiveSupport::Concern

    included do
      property :end_date, predicate: ::RDF::Vocab::SCHEMA.endDate do |index|
        index.as :stored_searchable, :dateable
      end
    end
  end
end
