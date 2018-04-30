# frozen_string_literal: true

module DogBiscuits
    module PackagedBy
      extend ActiveSupport::Concern
  
      included do
        filters_association :packaged_by, as: :aips, condition: :aip?
        filters_association :packaged_by, as: :dips, condition: :dip?
        filters_association :packaged_by, as: :packages, condition: :package?
      end
    end
end
  

