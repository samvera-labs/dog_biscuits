# frozen_string_literal: true

class DbIsReferencedBy < ActiveRecord::Base
  belongs_to :db_entry
end
