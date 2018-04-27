# frozen_string_literal: true

module DogBiscuits
  module MaintenanceAgencyCode
    extend ActiveSupport::Concern

    included do
      property :maintenance_agency_code,
               predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/maintenanceAgencyCode'),
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
