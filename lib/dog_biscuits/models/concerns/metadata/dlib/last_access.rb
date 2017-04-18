# frozen_string_literal: true

module DogBiscuits
  # date of last access
  module LastAccess
    extend ActiveSupport::Concern

    included do
      property :last_access, predicate: DogBiscuits::Vocab::Generic.lastAccess,
                             multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
