# frozen_string_literal: true

class DogBiscuits::EditFieldsAndInputsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Creates files needed for the forms.
       '

  def banner
    say_status("info", "Adding edit fields and inputs", :blue)
  end

  def create_inputs
    copy_file 'singularize_input.rb', 'app/inputs/singularize_input.rb'
  end

  def create_edit_fields
    directory 'views/records', 'app/views/records'
  end
end
