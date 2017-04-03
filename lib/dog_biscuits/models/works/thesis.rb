module DogBiscuits
  # thesis
  class Thesis < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
      true
    end

    # Index additional fields into solr
    class ThesisIndexer < Hyrax::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include DogBiscuits::IndexesThesis
    end

    def self.indexer
      ThesisIndexer
    end
  end
end
