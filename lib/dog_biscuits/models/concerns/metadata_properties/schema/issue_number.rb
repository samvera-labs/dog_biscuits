# frozen_string_literal: true

module DogBiscuits
  module IssueNumber
    extend ActiveSupport::Concern

    included do
      property :issue_number, predicate: RDF::Vocab::SCHEMA.issueNumber do |index|
        index.as :stored_searchable
      end
    end
  end
end
