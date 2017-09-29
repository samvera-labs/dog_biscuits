# frozen_string_literal: true

module DogBiscuits
  class Dataset < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << ::RDF::Vocab::DCAT.Dataset

    include DogBiscuits::AddDatasetMetadata

    filters_association :packaged_by, as: :aips, condition: :aip?
    filters_association :packaged_by, as: :dips, condition: :dip?
    filters_association :packaged_by, as: :packages, condition: :package?

    before_save :combine_dates

    def dataset?
      true
    end

    self.indexer = DogBiscuits::DatasetIndexer

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_available
    end
  end
end
