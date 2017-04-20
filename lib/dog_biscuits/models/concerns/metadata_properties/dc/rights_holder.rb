# frozen_string_literal: true

module DogBiscuits
  module RightsHolder
    extend ActiveSupport::Concern

    included do
      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder,
                               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
