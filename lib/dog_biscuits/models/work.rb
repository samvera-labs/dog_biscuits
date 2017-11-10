# frozen_string_literal: true

module DogBiscuits
  class Work < ActiveFedora::Base
    # DO NOT include AddWorkBehaviour here otherwise individual works will get the wrong 'type'
    include DogBiscuits::ValidateLabel

    has_and_belongs_to_many :packaged_by,
                            class_name: 'DogBiscuits::Package',
                            predicate: DogBiscuits::Vocab::Generic.packagedBy,
                            inverse_of: :packages

    def authority?
      false
    end

    def agent?
      false
    end

    def work?
      true
    end

    def file_set?
      false
    end

    def collection?
      false
    end

    def combine_dates
      self.date = []
    end
  end
end
