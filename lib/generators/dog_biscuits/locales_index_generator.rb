# frozen_string_literal: true

class DogBiscuits::LocalesIndexGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
  Injects the blacklight index properties
  '

  def banner
    say_status("info", "Generating blacklight index locale", :blue)
  end

  def update_index
    properties = DogBiscuits.config.index_properties

    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?
      # Index is after index
      inject_into_file 'config/locales/hyrax.en.yml', before: '        show:' do
        "          #{prop}_tesim: #{DogBiscuits.config.property_mappings[prop][:label]}\n"
      end
    end
  end
end
