# frozen_string_literal: true

module DogBiscuits
  module StartDate
    extend ActiveSupport::Concern

    included do
      property :start_date, predicate: ::RDF::Vocab::SCHEMA.startDate do |index|
        index.as :stored_searchable
      end
    end
  end
end
