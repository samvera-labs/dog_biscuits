# frozen_string_literal: true

module DogBiscuits
  # foaf name, split into family and given
  module FoafNameParts
    extend ActiveSupport::Concern

    included do
      # Eg. NCA Rules 2.4.
      property :family_name, predicate: ::RDF::Vocab::FOAF.familyName,
                             multiple: false do |index|
        index.as :stored_searchable
      end

      # Eg. NCA Rules 2.3.
      property :given_name, predicate: ::RDF::Vocab::FOAF.givenName,
                            multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
