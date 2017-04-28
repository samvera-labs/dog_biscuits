# frozen_string_literal: true

module DogBiscuits
  module Edition
    extend ActiveSupport::Concern

    included do
      property :edition, predicate: ::RDF::Vocab::BF2.edition,
                         multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
