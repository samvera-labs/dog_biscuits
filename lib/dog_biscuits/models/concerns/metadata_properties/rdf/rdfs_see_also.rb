# frozen_string_literal: true

module DogBiscuits
  module RdfsSeeAlso
    extend ActiveSupport::Concern

    included do
      property :rdfs_see_also, predicate: ::RDF::RDFS.seeAlso do |index|
        index.as :stored_searchable
      end
    end
  end
end
