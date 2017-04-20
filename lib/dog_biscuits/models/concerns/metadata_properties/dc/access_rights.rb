# frozen_string_literal: true

module DogBiscuits
  module AccessRights
    extend ActiveSupport::Concern

    included do
      # There is an access_rights property in Hyrax, hence the dc_
      property :dc_access_rights, predicate: ::RDF::Vocab::DC.accessRights,
                                  multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
