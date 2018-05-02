# frozen_string_literal: true

module DogBiscuits
  class Dataset < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::Vocab::DCAT.Dataset

    filters_association :packaged_by, as: :aips, condition: :aip?
    filters_association :packaged_by, as: :dips, condition: :dip?
    filters_association :packaged_by, as: :packages, condition: :package?

    # Indexer
    # self.indexer = DogBiscuits::DatasetIndexer
    # Metadata
    # include DogBiscuits::DatasetMetadata

    # before_save :combine_dates

    def dataset?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_available
      date << date_created
      date << date_updated
      date << date_copyrights
      date << date_collected
      date << date_valid
    end
  end
end
