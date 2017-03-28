module DogBiscuits
  # dataset
  class Dataset < Work
    include DogBiscuits::AddDatasetMetadata

    filters_association :packaged_by, as: :aips, condition: :aip?
    filters_association :packaged_by, as: :dips, condition: :dip?
    #filters_association :members, as: :packages, condition: :package?

    type << ::RDF::Vocab::DCAT.Dataset

    # TODO look at how CC handles this and fix clash
    # where does this come from? is it in pure? NOT IN PUREE check ws
    property :embargo_release,
             predicate: DogBiscuits::Vocab::Generic.embargoRelease,
             multiple: false do |index|
      index.as :stored_searchable
    end
    property :retention_policy,
             predicate: DogBiscuits::Vocab::Generic.retentionPolicy,
             multiple: true do |index|
      index.as :stored_searchable
    end
    property :restriction_note,
             predicate: DogBiscuits::Vocab::Generic.restrictionNote,
             multiple: true do |index|
      index.as :stored_searchable
    end

    def dataset?
      true
    end

    # Force the type of certain indexed fields in solr
    # (inspired by
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-63,
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-64
    #   and discussed at
    #   https://groups.google.com/forum/#!topic/hydra-tech/rRsBwdvh5dE)
    # This is to overcome limitations with solrizer and
    #   "index.as :stored_sortable" always defaulting to string rather
    #   than text type (solr sorting on string fields is case-sensitive,
    #   on text fields it's case-insensitive)
    # Extend Hydra::PCDM::PCDMIndexer instead of ActiveFedora::IndexingService
    class DatasetIndexer < Hyrax::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include DogBiscuits::IndexesDataset
    end

    def self.indexer
      DatasetIndexer
    end
  end
end