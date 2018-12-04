# frozen_string_literal: true

module DogBiscuits
  class PackageIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # NB. include 'contributor' here if it is used in the form
    def contributors_to_index
      []
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc)
      solr_doc['package_ids_ssim'] = object.packages.map(&:id)
    end
  end
end
