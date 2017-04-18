# frozen_string_literal: true

class DbPlaceAsWritten < ActiveRecord::Base
  belongs_to :db_related_place
end
