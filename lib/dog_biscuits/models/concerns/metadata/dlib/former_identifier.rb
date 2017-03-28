module DogBiscuits
  # former identifiers
  module FormerIdentifier
    extend ActiveSupport::Concern

    included do
      property :former_id, predicate: DogBiscuits::Vocab::Generic.formerIdentifier,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
