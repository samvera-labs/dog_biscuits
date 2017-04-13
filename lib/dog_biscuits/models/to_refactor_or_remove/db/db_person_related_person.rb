# frozen_string_literal: true

class DbPersonRelatedPerson < ActiveRecord::Base
  belongs_to :db_related_agent
end
