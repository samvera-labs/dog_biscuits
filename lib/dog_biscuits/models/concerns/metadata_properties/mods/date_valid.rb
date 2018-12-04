# frozen_string_literal: true

module DogBiscuits
  module DateValid
    extend ActiveSupport::Concern

    included do
      property :date_valid,
               predicate: ::RDF::Vocab::MODS.dateValid do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
