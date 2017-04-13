# frozen_string_literal: true

class DbSubject < ActiveRecord::Base
  belongs_to :db_entry
end
