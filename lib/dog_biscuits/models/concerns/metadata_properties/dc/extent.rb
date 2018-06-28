# frozen_string_literal: true

module DogBiscuits
  module Extent
    extend ActiveSupport::Concern

    included do
      property :extent, predicate: ::RDF::Vocab::DC.extent do |index|
        index.as :stored_searchable
      end
    end
  end
end
