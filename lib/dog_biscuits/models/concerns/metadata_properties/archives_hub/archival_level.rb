# frozen_string_literal: true

module DogBiscuits
  module ArchivalLevel
    extend ActiveSupport::Concern

    included do
      # strictly the range is a Level resource
      property :archival_level,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/level') do |index|
        index.as :stored_searchable
      end
    end
  end
end
