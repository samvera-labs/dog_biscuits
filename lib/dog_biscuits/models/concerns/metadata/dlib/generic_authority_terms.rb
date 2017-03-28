module DogBiscuits
  # local authorities terms defined in generic vocab
  module GenericAuthorityTerms
    extend ActiveSupport::Concern

    included do
      property :approved, predicate: DogBiscuits::Vocab::Generic.approved,
                          multiple: false do |index|
        index.as :stored_searchable
      end
      property :used, predicate: DogBiscuits::Vocab::Generic.used,
                      multiple: false do |index|
        index.as :stored_searchable
      end
      property :rules, predicate: DogBiscuits::Vocab::Generic.rules,
                       multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
