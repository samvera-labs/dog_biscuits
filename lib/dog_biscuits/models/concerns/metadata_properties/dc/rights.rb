# frozen_string_literal: true

module DogBiscuits
  module Rights
    extend ActiveSupport::Concern

    included do
      # TODO: Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights_description, predicate: ::RDF::Vocab::DC11.rights do |index|
        index.as :stored_searchable
      end

      # TODO: align with Hyrax:BasicMetadata
      property :license, predicate: ::RDF::Vocab::DC.rights do |index|
        index.as :stored_searchable
      end
    end
  end
end
