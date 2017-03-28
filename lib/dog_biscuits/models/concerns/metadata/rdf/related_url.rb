module DogBiscuits
  # RDFS seeAlso
  module RelatedUrl
    extend ActiveSupport::Concern

    included do
      property :related_url, predicate: ::RDF::RDFS.seeAlso,
                               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
