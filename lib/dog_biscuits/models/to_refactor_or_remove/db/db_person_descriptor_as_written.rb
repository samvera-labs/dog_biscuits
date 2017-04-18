# frozen_string_literal: true

class DbPersonDescriptorAsWritten < ActiveRecord::Base
  belongs_to :db_related_agent
end
