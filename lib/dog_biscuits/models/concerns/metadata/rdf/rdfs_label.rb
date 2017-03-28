module DogBiscuits
  # RDFS label
  module RdfsLabel
    extend ActiveSupport::Concern
    included do
      property :rdfs_label, predicate: ::RDF::RDFS.label,
                            multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
