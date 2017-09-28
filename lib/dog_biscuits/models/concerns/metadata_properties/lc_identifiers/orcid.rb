# frozen_string_literal: true

module DogBiscuits
  module Orcid
    extend ActiveSupport::Concern

    included do
      property :orcid, predicate: ::RDF::Vocab::Identifiers.orcid do |index|
        index.as :stored_searchable
      end
    end
  end
end
