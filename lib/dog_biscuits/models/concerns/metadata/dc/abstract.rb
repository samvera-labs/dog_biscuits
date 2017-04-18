# frozen_string_literal: true

module DogBiscuits
  # DC abstract
  module Abstract
    extend ActiveSupport::Concern

    included do
      property :abstract, predicate: ::RDF::Vocab::DC.abstract,
                          multiple: true do |index|
        index.type :text
        index.as :stored_searchable, :sortable
      end
    end
  end
end
