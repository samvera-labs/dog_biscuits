# frozen_string_literal: true

module DogBiscuits
  module Pure
    extend ActiveSupport::Concern

    included do
      property :pure_uuid,
               predicate: DogBiscuits::Vocab::PureTerms.pureUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_creation,
               predicate: DogBiscuits::Vocab::PureTerms.pureCreation,
               multiple: false do |index|
        index.as :stored_searchable, :stored_sortable
      end
      property :pure_type,
               predicate: DogBiscuits::Vocab::PureTerms.pureType do |index|
        index.as :stored_searchable
      end
      property :pure_link,
               predicate: DogBiscuits::Vocab::PureTerms.pureLink do |index|
        index.as :stored_searchable
      end
    end
  end
end
