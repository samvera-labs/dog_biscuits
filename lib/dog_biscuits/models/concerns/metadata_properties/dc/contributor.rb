# frozen_string_literal: true

module DogBiscuits
  module Contributor
    extend ActiveSupport::Concern

    included do
      # use MARCRelator instead of dc.contributor to avoid solr conflict
      has_and_belongs_to_many :contributor_resource,
                              # predicate: ::RDF::Vocab::DC.contributor
                              predicate: ::RDF::Vocab::MARCRelators.ctb,
                              class_name: 'DogBiscuits::Agent'

      property :contributor, predicate: ::RDF::Vocab::DC11.contributor do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
