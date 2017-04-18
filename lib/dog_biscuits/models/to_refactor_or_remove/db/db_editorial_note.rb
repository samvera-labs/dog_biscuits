# frozen_string_literal: true

class DbEditorialNote < ActiveRecord::Base
  belongs_to :db_entry
end
