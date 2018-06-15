# frozen_string_literal: true

module DogBiscuits
  module EventDate
    extend ActiveSupport::Concern

    included do
      property :event_date, predicate: ::RDF::Vocab::DWC.eventDate do |index|
        index.type :date
        index.as :stored_searchable, :facetable, :dateable, :sortable
      end
    end
  end
end
