# frozen_string_literal: true
class DogBiscuits::ControlledPropertiesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator updates the controlled properties with _label. It is run by the Work generator.
       '

  # Moved to a separate generator because of a NameError happening on first run of a work generator.
  def update_presenter
    presenter = File.join('app/presenters/hyrax', class_path, "#{file_name}_presenter.rb")
    prepend_file presenter, "# Updated by \n#  `rails generate dog_biscuits:work <%= class_name %>`"

    # Remove basic_metadata so we don't duplicate what's in the WorkShowPresenter
    delegates = DogBiscuits.config.send("#{file_name}_properties") - DogBiscuits.config.base_properties
    injection = "\n    delegate :#{delegates.join(', :')}, to: :solr_document"
    model = class_name.to_s.constantize

    # Append _label onto any controlled properties
    delegates.each do |d|
      injection = injection.gsub(d, "#{d}_label".to_sym) if model.controlled_properties.include? d
    end

    unless presenter.include? injection
      inject_into_file presenter, after: 'Hyrax::WorkShowPresenter' do
        injection
      end
    end
  end

  def update_catalog_controller_for_controlled_properties
    catalog_file = File.join('app/controllers', class_path, 'catalog_controller.rb')
    class_name.to_s.constantize.controlled_properties.each do |prop|
      gsub_file catalog_file, /#{prop}/, "#{prop}_label"
    end
  end

  # TODO: _label from controlled_properties into labels
end
