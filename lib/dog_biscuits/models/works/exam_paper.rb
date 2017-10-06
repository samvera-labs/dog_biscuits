# frozen_string_literal: true

module DogBiscuits
  class ExamPaper < Work
    # # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    # Indexer
    # self.indexer = DogBiscuits::ExamPaperIndexer
    # Metadata
    # include DogBiscuits::ExamPaperMetadata

    def exam_paper?
      true
    end
  end
end
