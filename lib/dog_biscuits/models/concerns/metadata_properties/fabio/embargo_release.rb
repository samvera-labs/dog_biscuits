# frozen_string_literal: true

module DogBiscuits
  module EmbargoRelease
    extend ActiveSupport::Concern

    included do
      property :embargo_release,
               predicate: ::RDF::URI.new('http://purl.org/spar/fabio/hasEmbargoDate'),
               multiple: false do |index|
        index.type :date
        index.as :stored_searchable
      end
    end
  end
end
