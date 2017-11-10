# frozen_string_literal: true

module DogBiscuits
  class ConceptRelatedValidator < ActiveModel::Validator
    def validate(record)
      # related MUST NOT be the same as broader or narrower.
      record.related.each do |s|
        record.broader.collect { |b| record.errors[:related] << "related cannot be the same as broader" if b == s }
        record.narrower.collect { |n| record.errors[:related] << "related cannot be the same as narrower" if n == s }
      end
    end
  end
end
