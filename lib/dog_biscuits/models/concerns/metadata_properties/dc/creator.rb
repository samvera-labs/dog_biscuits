# frozen_string_literal: true

module DogBiscuits
  module Creator
    extend ActiveSupport::Concern

    included do
      # use MARCRelator instead of dc.creator to avoid solr conflict with creator property
      # For HABM, 'creator_resource' isn't used for solr indexing, the predicate name is
      #   this is inconsistent
      has_and_belongs_to_many :creator_resource,
                              # predicate: ::RDF::Vocab::DC.creator,
                              predicate: ::RDF::Vocab::MARCRelators.cre,
                              class_name: 'DogBiscuits::Agent'

      property :creator, predicate: ::RDF::Vocab::DC11.creator do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
