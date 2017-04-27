# frozen_string_literal: true

module DogBiscuits
  module Isbn
    extend ActiveSupport::Concern

    included do
      property :isbn, predicate: ::RDF::Vocab::Identifiers.isbn,
                     multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
