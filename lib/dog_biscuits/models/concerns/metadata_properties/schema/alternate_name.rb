# frozen_string_literal: true

module DogBiscuits
  module AlternateName
    extend ActiveSupport::Concern

    included do
      property :alternate_name, predicate: RDF::Vocab::SCHEMA.alternateName,
                                multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
