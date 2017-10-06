# frozen_string_literal: true

class DogBiscuits::EditFieldsAndInputsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Adding edit fields and inputs", :blue)
  end

  def copy_inputs
    copy_file 'singularize_input.rb', 'app/inputs/singularize_input.rb'
  end

  def copy_edit_fields
    directory 'records', 'app/views/records'
  end
end
