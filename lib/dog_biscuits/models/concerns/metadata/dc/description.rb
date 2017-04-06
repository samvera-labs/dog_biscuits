# frozen_string_literal: true

module DogBiscuits
  # DC description
  module Description
    extend ActiveSupport::Concern

    included do
      property :description, predicate: ::RDF::Vocab::DC11.description,
                             multiple: true do |index|
        index.type :text
        index.as :stored_searchable, :sortable
      end
    end
  end
end
