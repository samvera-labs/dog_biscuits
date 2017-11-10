# frozen_string_literal: true

require 'dog_biscuits'
require 'rails'
module DogBiscuits
  class Railtie < Rails::Railtie
    railtie_name :dog_biscuits

    rake_tasks do
      load "tasks/authorities.rake"
    end
  end
end
