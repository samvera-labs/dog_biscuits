# frozen_string_literal: true

module DogBiscuits
  module Part
    extend ActiveSupport::Concern

    included do
      property :part, predicate: ::RDF::Vocab::BF2.part,
                               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
