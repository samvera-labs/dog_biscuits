require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::WorkGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ModelHelpers
  source_root File.expand_path('../templates', __FILE__)

  class_option :skipmodel, type: :boolean, default: false

  desc '
This generator makes the following changes to your application:
    1. Checks that the requested Work is supported by DogBiscuits
    2. Runs the Hyrax generator for the given model
    3. Creates a new model, form and indexer to replace the Hyrax one
    3a. When --skipmodel is specified the model and indexer steps in 3. are skipped to allow for custom local properties
    4. Injects properties into the Hyrax-generated presenter
    5. Creates an attribute_rows view file using the configured properties for the work
    6. Updates the schema_org config, hyrax (en) locale using the configured properties for the work
    7. Updates the catalog controller with the configured properties for the work
    8. If this is a Hyku application, enables UV / IIIF
       '

  def banner
    say_status("info", "CREATING DOG BISCUITS WORK: #{class_name}", :blue)
  end

  def supported_model
    unless DogBiscuits.config.available_models.include? class_name
      say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.map {|m| m}.join(', ') }", :red)
      exit 0
    end
  end

  def ask_about_property_configuration
    unless options[:force]
      question = 'The work will be configured with default properties. To customize properties before running the generator, edit config/initiazliers/dog_biscuits.rb. Continue?'
      answer = ask question, default: 'Y'
      unless answer == 'Y'
        say_status("info", "CANCELLING", :red)
        exit 0
      end
    end
  end

  def hyrax_work_generator
    unless options[:force]
      if File.exist? File.join('app/models/', class_path, "#{file_name}.rb")
        question = 'It looks like you ran the Hyrax work generator. Changes to the generated files will be overwritten. Continue?)'
        answer = ask question, default: 'Y'
        unless answer == 'Y'
          say_status("info", "CANCELLING", :red)
          exit 0
        end
      end
    end
    say_status("info", "RUNNING rails generate hyrax:work #{class_name}", :blue)
    generate "hyrax:work #{class_name}", '-f'
  end

  def create_indexer
    if options[:skipmodel]
      say_status("info", "SKIPPING INDEXER GENERATION", :blue)
    else
      template('indexer.rb.erb', File.join('app/indexers', class_path, "#{file_name}_indexer.rb"))
    end
  end

  def create_model
    if options[:skipmodel]
      say_status("info", "SKIPPING MODEL GENERATION", :blue)
    else
      template('model.rb.erb', File.join('app/models/', class_path, "#{file_name}.rb"))
    end
  end

  def create_form
    template('form.rb.erb', File.join('app/forms/hyrax', class_path, "#{file_name}_form.rb"))
  end

  # This is the same as the Hyrax file, but we want to ensure we are running against a clean file
  def create_presenter
    template('presenter.rb.erb', File.join('app/presenters/hyrax', class_path, "#{file_name}_presenter.rb"))
  end

  def create_actor
    template('actor.rb.erb', File.join('app/actors/hyrax/actors', class_path, "#{file_name}_actor.rb"))
  end

  def create_attribute_rows
    generate "dog_biscuits:attribute_rows #{class_name}", '-f'
  end

  def update_locales
    generate "dog_biscuits:locales #{class_name}", '-f'
  end

  def create_schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

  def create_catalog_controller
    generate 'dog_biscuits:catalog_controller', '-f'
  end

  # moved out due to NameError (caused by controlled_properties call)
  def presenter_and_controlled_properties
    generate "dog_biscuits:controlled_properties #{class_name}", '-f'
  end

  # If this is a Hyku app, support IIIF / UV rendering
  def image_ify
    if File.exist?('config/initializers/version.rb') and File.read('config/initializers/version.rb').include? 'Hyku'
      model_injection = "  include HasRendering"
      inject_into_file "app/models/#{file_name}", after: 'WorkBehavior' do
        "\n#{model_injection}"
      end unless File.read("app/models/#{file_name}").include? model_injection

      # add 'rendering_ids' to the form
      form_injection = "    self.terms += [:rendering_ids]"
      form_injection += "\n\n    def secondary_terms"
      form_injection += "\n       super - [:rendering_ids]"
      form_injection += "\n    end"
      gsub_file "app/forms/hyrax/#{class_name.underscore}_form.rb", /self\.terms \+\= \[\]/, form_injection

      # change from WorkShowPresenter to ManifestEnabledWorkShowPresente
      presenter_injection = "Hyku::ManifestEnabledWorkShowPresenter"
      gsub_file "app/presenters/hyrax/#{class_name.underscore}_presenter.rb", /Hyrax::WorkShowPresenter/, presenter_injection

      # add Hyku::IIIFManifest to the controllers
      controller_injection = "\n\n    include Hyku::IIIFManifest"
      inject_into_file "app/controllers/hyrax/#{class_name.underscore}_controller.rb", after: "::#{class_name}" do
        controller_injection
      end unless File.read("app/controllers/hyrax/#{class_name.underscore}_controller.rb").include? controller_injection

      # add all properties to the delegates block of Hyku::ManifestEnabledWorkShowPresenter
      delegates = DogBiscuits.config.all_properties - DogBiscuits.config.base_properties
      gsub_file 'app/presenters/hyku/manifest_enabled_work_show_presenter.rb', /delegate :extent/, "delegate #{delegates.join(', :')} :extent"
    end
  end

  def display_readme
    readme 'README'
  end

end
