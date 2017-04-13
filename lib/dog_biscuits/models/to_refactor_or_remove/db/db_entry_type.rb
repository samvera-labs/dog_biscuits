# frozen_string_literal: true

class DbEntryType < ActiveRecord::Base
  belongs_to :db_entry
end
