# frozen_string_literal: true

module DogBiscuits
  module Editor
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :editor_resource,
                              class_name: 'DogBiscuits::Agent',
                              predicate: ::RDF::Vocab::MARCRelators.edc

      property :editor, predicate: ::RDF::Vocab::BIBO.editor,
                        multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
