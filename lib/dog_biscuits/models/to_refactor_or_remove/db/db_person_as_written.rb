# frozen_string_literal: true

class DbPersonAsWritten < ActiveRecord::Base
  belongs_to :db_related_agent
end
