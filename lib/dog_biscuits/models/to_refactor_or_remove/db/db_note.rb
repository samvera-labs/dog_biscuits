# frozen_string_literal: true

class DbNote < ActiveRecord::Base
  belongs_to :db_entry
end
