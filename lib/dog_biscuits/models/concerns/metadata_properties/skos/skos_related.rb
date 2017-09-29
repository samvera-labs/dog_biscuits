# frozen_string_literal: true

module DogBiscuits
  module SkosRelated
    extend ActiveSupport::Concern

    included do
      property :related, predicate: ::RDF::Vocab::SKOS.related do |index|
        index.as :stored_searchable
      end
    end
  end
end
