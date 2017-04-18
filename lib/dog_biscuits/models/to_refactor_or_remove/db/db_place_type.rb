# frozen_string_literal: true

class DbPlaceType < ActiveRecord::Base
  belongs_to :db_related_place
end
