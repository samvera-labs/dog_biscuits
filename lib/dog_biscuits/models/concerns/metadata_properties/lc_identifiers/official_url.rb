# frozen_string_literal: true

module DogBiscuits
  module OfficialUrl
    extend ActiveSupport::Concern

    included do
      property :official_url, predicate: ::RDF::Vocab::Identifiers.uri do |index|
        index.as :stored_searchable
      end
    end
  end
end
