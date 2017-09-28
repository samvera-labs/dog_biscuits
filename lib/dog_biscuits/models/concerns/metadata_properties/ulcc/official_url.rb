# frozen_string_literal: true

module DogBiscuits
  module OfficialUrl
    extend ActiveSupport::Concern

    included do
      property :official_url, predicate: DogBiscuits::Vocab::UlccTerms.officialUrl do |index|
        index.as :stored_searchable
      end
    end
  end
end
