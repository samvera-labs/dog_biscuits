# frozen_string_literal: true

module DogBiscuits
  # Issue Number
  module IssueNumber
    extend ActiveSupport::Concern

    included do
      property :issue_number, predicate: RDF::Vocab::SCHEMA.issueNumber,
                              multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
