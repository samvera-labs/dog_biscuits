# frozen_string_literal: true

module DogBiscuits
  module Source
    extend ActiveSupport::Concern

    included do
      property :source, predicate: ::RDF::Vocab::DC.source do |index|
        index.as :stored_searchable
      end
    end
  end
end
