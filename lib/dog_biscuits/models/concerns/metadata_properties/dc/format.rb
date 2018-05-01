# frozen_string_literal: true

module DogBiscuits
  module Format
    extend ActiveSupport::Concern

    included do
      property :dc_format, predicate: ::RDF::Vocab::DC11.format do |index|
        index.as :stored_searchable
      end
    end
  end
end
