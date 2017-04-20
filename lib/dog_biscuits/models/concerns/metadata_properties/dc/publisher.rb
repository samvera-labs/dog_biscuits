# frozen_string_literal: true

module DogBiscuits
  module Publisher
    extend ActiveSupport::Concern

    included do
      # use MARCRelator instead of dc.publisher to avoid solr conflict with publisher property
      has_and_belongs_to_many :publisher_resource,
                              class_name: 'DogBiscuits::Agent',
                              # predicate: ::RDF::Vocab::DC.publisher
                              predicate: ::RDF::Vocab::MARCRelators.pbl

      # DC11 for publisher name as string
      property :publisher, predicate: ::RDF::Vocab::DC11.publisher,
                           multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
