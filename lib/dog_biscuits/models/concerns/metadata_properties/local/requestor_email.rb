# frozen_string_literal: true

module DogBiscuits
  module RequestorEmail
    extend ActiveSupport::Concern

    included do
      property :requestor_email, predicate: DogBiscuits::Vocab::Generic.requestorEmail do |index|
        index.as :stored_searchable
      end
    end
  end
end
