# frozen_string_literal: true

module DogBiscuits
  module Width
    extend ActiveSupport::Concern

    included do
      property :width, predicate: ::RDF::Vocab::EXIF.width do |index|
        index.as :stored_searchable
      end
    end
  end
end
