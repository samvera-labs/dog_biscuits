# frozen_string_literal: true

module DogBiscuits
  module Location
    extend ActiveSupport::Concern

    included do
      # TODO: USE THIS INSTEAD OF BASED NEAR
      property :location, predicate: ::RDF::Vocab::SCHEMA.location, class_name: Hyrax::ControlledVocabularies::Location
    end
  end
end
