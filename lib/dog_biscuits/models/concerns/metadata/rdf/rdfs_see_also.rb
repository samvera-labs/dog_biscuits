module DogBiscuits
  # RDFS seeAlso
  module RdfsSeeAlso
    extend ActiveSupport::Concern

    included do
      property :rdfs_see_also, predicate: ::RDF::RDFS.seeAlso,
                               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
