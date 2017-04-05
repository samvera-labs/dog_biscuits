# frozen_string_literal: true

module DogBiscuits
  # local terms for workflow status
  module GenericWorkflow
    extend ActiveSupport::Concern

    included do
      property :wf_status, predicate: DogBiscuits::Vocab::Generic.status,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
