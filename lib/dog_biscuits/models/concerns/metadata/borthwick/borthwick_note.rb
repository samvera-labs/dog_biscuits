# frozen_string_literal: true

module DogBiscuits
  # borthwick registers note
  module BorthwickNote
    extend ActiveSupport::Concern

    included do
      property :note, predicate: DogBiscuits::Vocab::BorthwickRegisters.note,
                      multiple: true do |index|
        index.type :text
        index.as :stored_searchable
      end
    end
  end
end
