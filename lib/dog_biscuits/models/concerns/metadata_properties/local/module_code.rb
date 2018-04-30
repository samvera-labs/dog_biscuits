# frozen_string_literal: true

module DogBiscuits
  module ModuleCode
    extend ActiveSupport::Concern

    included do
      property :module_code, predicate: DogBiscuits::Vocab::Generic.moduleCode do |index|
        index.as :stored_searchable
      end
    end
  end
end
