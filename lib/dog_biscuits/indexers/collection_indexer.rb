# frozen_string_literal: true

module DogBiscuits
  class CollectionIndexer < Hyrax::CollectionIndexer
    include DogBiscuits::IndexesCommon

    # Add any custom indexing into here. Method must exist, but can be empty.
    def do_local_indexing(solr_doc); end
  end
end
