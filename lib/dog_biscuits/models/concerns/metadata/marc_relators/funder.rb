module DogBiscuits
  # RDF type
  module Funder
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :funder_resource,
                              class_name: 'DogBiscuits::Agent',
                              predicate: ::RDF::Vocab::MARCRelators.fnd

      property :funder, predicate: ::RDF::Vocab::MARCRelators.fnd,
               multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end