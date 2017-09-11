# frozen_string_literal: true

module DogBiscuits
  module KeywordSubject
    extend ActiveSupport::Concern

    included do
      # Controlled Subjects from internal schemes
      # MODS:subjectTopic is used instead of dc:subject to avoid clash with 'subject':
      #   HABMs are added to solr with the predicate name (subjectTopic) rather than the relation name (subject_resource)
      #   FOAF.topic would be an alternative
      has_and_belongs_to_many :subject_resource,
                              class_name: 'DogBiscuits::Concept',
                              # predicate: ::RDF::Vocab::DC.subject
                              predicate: ::RDF::Vocab::DC.subject

      # DC11 for uncontrolled keywords.
      property :keyword, predicate: ::RDF::Vocab::SCHEMA.keywords do |index|
        index.as :stored_searchable, :facetable
      end
      # Controlled Subjects from external schemes
      property :subject, predicate: ::RDF::Vocab::DC11.subject do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
