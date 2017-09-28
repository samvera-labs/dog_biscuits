# frozen_string_literal: true

module DogBiscuits
  module HasRestriction
    extend ActiveSupport::Concern

    included do
      property :has_restriction,
               predicate: ::RDF::Vocab::PREMIS.hasRestriction do |index|
        index.type :date
        index.as :stored_searchable
      end
    end
  end
end
