# frozen_string_literal: true

module DogBiscuits
  # DC rights holder and license
  module Rights
    extend ActiveSupport::Concern

    included do
      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights_description, predicate: ::RDF::Vocab::DC11.rights,
                                    multiple: true do |index|
        index.as :stored_searchable
      end

      # align with Hyrax:BasicMetadata
      property :license, predicate: ::RDF::Vocab::DC.rights,
                         multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
