# frozen_string_literal: true

module DogBiscuits
  module SkosNote
    extend ActiveSupport::Concern

    included do
      property :note, predicate: ::RDF::Vocab::SKOS.note do |index|
        index.as :stored_searchable
      end
    end
  end
end
