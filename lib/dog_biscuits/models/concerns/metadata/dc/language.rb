# frozen_string_literal: true

module DogBiscuits
  # DC language
  module Language
    extend ActiveSupport::Concern

    # TODO: REVIEW

    included do
      # before_save :add_language_value

      # language code
      property :language_code, predicate: ::RDF::Vocab::DC.language,
                               multiple: true do |index|
        index.as :stored_searchable
      end

      property :language, predicate: ::RDF::Vocab::DC11.language,
                          multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      # This requires that the calling app has QA installed and the languages list available
      # def add_language_value
      #   begin
      #     # change this to use the lexvo one
      #     auth = Qa::Authorities::Local::FileBasedAuthority.new('languages')
      #     self.language = self.language_code.collect { |x| auth.find(x)['term'] }
      #   rescue
      #     'You need QA installed to add language'
      #   end
      # end
    end
  end
end
