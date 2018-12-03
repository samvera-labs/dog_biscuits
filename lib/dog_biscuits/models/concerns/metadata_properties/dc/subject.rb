# frozen_string_literal: true

module DogBiscuits
  module Subject
    extend ActiveSupport::Concern

    included do
      property :subject, predicate: ::RDF::Vocab::DC11.subject do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
