# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::ImagifyGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ModelHelpers
  source_root File.expand_path('../templates', __FILE__)

  class_option :skipmodel, type: :boolean, default: false

  desc '
This generator makes the following changes to your application:
    1. If this is a Hyku application, enables UV / IIIF
       '

  def banner
    say_status("info", "Enabling UV / IIIF support for #{class_name}", :blue)

    if class_name == 'All'
      @models = DogBiscuits.config.selected_models.map(&:underscore)
    else
      if DogBiscuits.config.selected_models.include? class_name
        @models = [class_name.underscore]
      else
        say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect { |m| m }.join(', ')}", :red)
        exit 0
      end
    end
  end

  # If this is a Hyku app, enable IIIF / UV rendering
  def image_ify_hyku
    @models.each do |model|
      next unless File.exist?('config/initializers/version.rb') && File.read('config/initializers/version.rb').include?('Hyku')
      model_injection = "  include HasRendering"
      unless File.read("app/models/#{model}.rb").include? model_injection
        inject_into_file "app/models/#{model}.rb", after: 'WorkBehavior' do
          "\n#{model_injection}"
        end
      end

      # add 'rendering_ids' to the form
      form_injection = "self.terms += [:rendering_ids]"
      form_injection += "\n\n    def secondary_terms"
      form_injection += "\n       super - [:rendering_ids]"
      form_injection += "\n    end"
      gsub_file "app/forms/hyrax/#{model}_form.rb", /self\.terms \+\= \[\]/, form_injection

      # change from WorkShowPresenter to ManifestEnabledWorkShowPresente
      presenter_injection = "Hyku::ManifestEnabledWorkShowPresenter"
      gsub_file "app/presenters/hyrax/#{model}_presenter.rb", /Hyrax::WorkShowPresenter/, presenter_injection

      # add Hyku::IIIFManifest to the controllers
      controller_injection = "\n\n    include Hyku::IIIFManifest"
      unless File.read("app/controllers/hyrax/#{model.pluralize}_controller.rb").include? controller_injection
        inject_into_file "app/controllers/hyrax/#{model.pluralize}_controller.rb", after: "::#{class_name}\n" do
          controller_injection
        end
      end

      # add all properties to the delegates block of Hyku::ManifestEnabledWorkShowPresenter
      delegates = DogBiscuits.config.all_properties - DogBiscuits.config.base_properties
      gsub_file 'app/presenters/hyku/manifest_enabled_work_show_presenter.rb', /delegate :extent/, "delegate :#{delegates.join(', :')}, :extent"
    end
  end
end
