# frozen_string_literal: true

module DogBiscuits
  module FoafName
    extend ActiveSupport::Concern

    included do
      # Equivalent of vra:name.
      # Eg. NCA Rules 4.
      property :name, predicate: ::RDF::Vocab::FOAF.name,
                      multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
