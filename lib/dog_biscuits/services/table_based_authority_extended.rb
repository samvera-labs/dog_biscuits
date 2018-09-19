# frozen_string_literal: true

module DogBiscuits
  class TableBasedAuthorityExtended < Qa::Authorities::Local::TableBasedAuthority
    def search(q)
      return [] if q.blank?
      output_set(base_relation.where('lower(label) like ?', "%#{q.downcase}%").limit(25))
    end
  end
end