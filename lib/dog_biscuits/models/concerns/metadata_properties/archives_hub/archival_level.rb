# frozen_string_literal: true

module DogBiscuits
  module ArchivalLevel
    extend ActiveSupport::Concern

    included do
      # strictly the range should be a Level resource, not a string
      property :archival_level,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/level')  do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
