# frozen_string_literal: true

module DogBiscuits
  class ExamPaper < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    def exam_paper?
      true
    end

    class ExamPaperIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesExamPaper
    end

    def self.indexer
      ExamPaperIndexer
    end
  end
end
