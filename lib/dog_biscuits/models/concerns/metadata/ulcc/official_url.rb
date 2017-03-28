module DogBiscuits
  # official url
  module OfficialUrl
    extend ActiveSupport::Concern

    included do
      property :official_url, predicate: DogBiscuits::Vocab::UlccTerms.officialUrl,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end