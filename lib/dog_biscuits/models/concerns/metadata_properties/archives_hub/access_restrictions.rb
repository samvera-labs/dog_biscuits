# frozen_string_literal: true

module DogBiscuits
  module AccessRestrictions
    extend ActiveSupport::Concern

    included do
      property :access_restrictions,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/accessRestrictions') do |index|
        index.as :stored_searchable
      end
    end
  end
end
