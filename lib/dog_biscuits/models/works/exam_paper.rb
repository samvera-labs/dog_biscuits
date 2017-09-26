# frozen_string_literal: true

module DogBiscuits
  class ExamPaper < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    def exam_paper?
      true
    end

    def self.indexer
      DogBiscuits::ExamPaperIndexer
    end
  end
end
