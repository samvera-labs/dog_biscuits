# frozen_string_literal: true

module DogBiscuits
  module OwlSameAs
    extend ActiveSupport::Concern

    included do
      property :same_as, predicate: ::RDF::OWL.sameAs do |index|
        index.as :stored_searchable
      end
    end
  end
end
