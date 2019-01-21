# frozen_string_literal: true

module DogBiscuits
  module Height
    extend ActiveSupport::Concern

    included do
      property :height, predicate: ::RDF::Vocab::EXIF.height do |index|
        index.as :stored_searchable
      end
    end
  end
end
