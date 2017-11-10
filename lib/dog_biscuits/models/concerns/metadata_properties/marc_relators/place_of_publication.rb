# frozen_string_literal: true

module DogBiscuits
  module PlaceOfPublication
    extend ActiveSupport::Concern

    included do
      property :place_of_publication, predicate: ::RDF::Vocab::MARCRelators.pup do |index|
        index.as :stored_searchable
      end
    end
  end
end
