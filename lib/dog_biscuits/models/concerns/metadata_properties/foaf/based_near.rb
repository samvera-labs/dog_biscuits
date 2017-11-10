# frozen_string_literal: true

module DogBiscuits
  module BasedNear
    extend ActiveSupport::Concern

    included do
      # this will use the deep indexing service
      property :based_near, predicate: ::RDF::Vocab::FOAF.based_near, class_name: Hyrax::ControlledVocabularies::Location
    end
  end
end
