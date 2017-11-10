# frozen_string_literal: true

module DogBiscuits
  module SkosLabels
    extend ActiveSupport::Concern

    included do
      property :preflabel, predicate: ::RDF::Vocab::SKOS.prefLabel,
                           multiple: false do |index|
        index.as :stored_searchable, :sortable
      end

      property :altlabel, predicate: ::RDF::Vocab::SKOS.altLabel do |index|
        index.as :stored_searchable
      end
    end
  end
end
