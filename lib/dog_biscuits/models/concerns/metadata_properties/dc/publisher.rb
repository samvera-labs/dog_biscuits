# frozen_string_literal: true

module DogBiscuits
  module Publisher
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :publisher_resource,
                              class_name: 'DogBiscuits::Agent',
                              # predicate: ::RDF::Vocab::DC.publisher
                              predicate: ::RDF::Vocab::MARCRelators.pbl

      property :publisher, predicate: ::RDF::Vocab::DC11.publisher do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
