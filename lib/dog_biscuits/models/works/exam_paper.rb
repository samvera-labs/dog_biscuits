module DogBiscuits
  # exam paper
  class ExamPaper < Work

    include DogBiscuits::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    before_save :add_qualification_name_values

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
