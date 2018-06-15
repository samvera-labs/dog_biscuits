# frozen_string_literal: true

module DogBiscuits
  module ResourceTypeGeneral
    extend ActiveSupport::Concern

    included do
      property :resource_type_general, predicate: ::RDF::Vocab::DataCite.hasGeneralResourceType do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
