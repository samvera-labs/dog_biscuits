# frozen_string_literal: true

module DogBiscuits
  module Department
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :department_resource,
                              class_name: 'DogBiscuits::Organisation',
                              predicate: DogBiscuits::Vocab::Uketd.department
    end
  end
end
