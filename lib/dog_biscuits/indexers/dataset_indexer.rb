# frozen_string_literal: true

module DogBiscuits
  class DatasetIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesDataset
  end
end
