# frozen_string_literal: true

module DogBiscuits
  module AccessProvidedBy
    extend ActiveSupport::Concern

    included do
      property :access_provided_by,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/accessProvidedBy') do |index|
        index.as :stored_searchable
      end
    end
  end
end
