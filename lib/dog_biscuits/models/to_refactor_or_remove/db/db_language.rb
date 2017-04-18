# frozen_string_literal: true

class DbLanguage < ActiveRecord::Base
  belongs_to :db_entry
end
