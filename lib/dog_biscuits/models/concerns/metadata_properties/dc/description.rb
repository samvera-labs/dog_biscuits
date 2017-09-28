# frozen_string_literal: true

module DogBiscuits
  module Description
    extend ActiveSupport::Concern

    included do
      property :description, predicate: ::RDF::Vocab::DC11.description do |index|
        index.type :text
        index.as :stored_searchable, :sortable
      end
    end
  end
end
