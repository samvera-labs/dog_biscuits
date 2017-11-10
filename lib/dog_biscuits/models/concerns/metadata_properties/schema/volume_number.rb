# frozen_string_literal: true

module DogBiscuits
  module VolumeNumber
    extend ActiveSupport::Concern

    included do
      property :volume_number, predicate: RDF::Vocab::SCHEMA.volumeNumber do |index|
        index.as :stored_searchable
      end
    end
  end
end
