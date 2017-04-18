# frozen_string_literal: true

class DbPersonRole < ActiveRecord::Base
  belongs_to :db_related_agent
end
