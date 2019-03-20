# frozen_string_literal: true
require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::PresenterGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ModelHelpers
  source_root File.expand_path('../../work/templates', __FILE__)

  desc '
This generator makes the following changes to your application:
    The DogBiscuits Presenter generator makes the following changes to your application:
    1. Creates the presenter
       '

  def banner
    say_status("info", "Creating presenter for: #{class_name}", :blue)
  end

  # This is in a separate generator to try and get round the NameError on first run
  #   caused when calling constantize on class_name (ie. the model class) in the template
  def presenter_template
    template('presenter.rb.erb', File.join('app/presenters/hyrax', class_path, "#{file_name}_presenter.rb"))
    rescue NameError => e
      say_status("error", e.message, :red)
  end
end
