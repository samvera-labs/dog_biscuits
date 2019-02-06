# frozen_string_literal: true

module DogBiscuits
  module ExampleOfWork
    extend ActiveSupport::Concern

    included do
      property :example_of_work, predicate: RDF::Vocab::SCHEMA.exampleOfWork do |index|
        index.as :stored_searchable
      end
    end
  end
end
