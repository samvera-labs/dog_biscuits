# frozen_string_literal: true

module DogBiscuits
  module SkosNote
    extend ActiveSupport::Concern

    included do
      property :note, predicate: ::RDF::Vocab::SKOS.note,
                      multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
