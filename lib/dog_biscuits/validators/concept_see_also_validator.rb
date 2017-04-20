# frozen_string_literal: true

module DogBiscuits
  class ConceptSeeAlsoValidator < ActiveModel::Validator
    def validate(record)
      # see_also MUST NOT be the same as broader or narrower.
      record.see_also.each do |s|
        record.broader.collect { |b| record.errors[:see_also] << "see_also cannot be the same as broader" if b == s }
        record.narrower.collect { |n| record.errors[:see_also] << "see_also cannot be the same as narrower" if n == s }
      end
    end
  end
end
