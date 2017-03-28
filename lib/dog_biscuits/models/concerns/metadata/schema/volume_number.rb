module DogBiscuits
  # Volume Number
  module VolumeNumber
    extend ActiveSupport::Concern

    included do
      property :volume_number, predicate: RDF::Vocab::SCHEMA.volumeNumber,
                           multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
