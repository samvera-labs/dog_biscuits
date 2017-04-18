# frozen_string_literal: true

class DbPlaceRole < ActiveRecord::Base
  belongs_to :db_related_place
end
