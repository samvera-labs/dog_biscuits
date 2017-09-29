# frozen_string_literal: true

module DogBiscuits
  class ExamPaper < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    include DogBiscuits::AddExamPaperMetadata

    def exam_paper?
      true
    end

    self.indexer = DogBiscuits::ExamPaperIndexer
  end
end
