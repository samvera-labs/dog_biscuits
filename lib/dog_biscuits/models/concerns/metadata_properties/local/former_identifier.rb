# frozen_string_literal: true

module DogBiscuits
  module FormerIdentifier
    extend ActiveSupport::Concern

    included do
      property :former_identifier, predicate: DogBiscuits::Vocab::Generic.formerIdentifier do |index|
        index.as :stored_searchable
      end
    end
  end
end
