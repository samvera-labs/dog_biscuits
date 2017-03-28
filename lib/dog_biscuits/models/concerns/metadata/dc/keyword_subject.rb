module DogBiscuits
  # DC keyword and subject
  module KeywordSubject
    extend ActiveSupport::Concern

    included do
      # DCTERMS subject for controlled subjects. Can't have both with single word name
      # has_and_belongs_to_many :subject_resource,
      #                         class_name: 'DogBiscuits::Concept',
      #                         predicate: ::RDF::Vocab::DC.subject

      # DC11 for free keywords.
      property :keyword, predicate: ::RDF::Vocab::DC11.subject,
                         multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
      property :subject, predicate: ::RDF::Vocab::DC.subject,
                         multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
