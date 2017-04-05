# frozen_string_literal: true

module DogBiscuits
  # exam paper
  class ExamPaper < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    def exam_paper?
      true
    end

    # Index additional fields into solr
    class ExamPaperIndexer < Hyrax::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include DogBiscuits::IndexesExamPaper
    end

    def self.indexer
      ExamPaperIndexer
    end
  end
end
