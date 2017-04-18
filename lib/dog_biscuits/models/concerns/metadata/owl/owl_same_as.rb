# frozen_string_literal: true

module DogBiscuits
  # OWL sameAs
  module OwlSameAs
    extend ActiveSupport::Concern

    included do
      property :same_as, predicate: ::RDF::OWL.sameAs, multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
