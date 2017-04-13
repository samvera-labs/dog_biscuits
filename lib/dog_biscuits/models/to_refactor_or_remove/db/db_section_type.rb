# frozen_string_literal: true

class DbSectionType < ActiveRecord::Base
  belongs_to :db_entry
end
