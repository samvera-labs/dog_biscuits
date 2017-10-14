require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::WorkGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ModelHelpers
  source_root File.expand_path('../templates', __FILE__)

  class_option :skip_model, type: :boolean, default: false

  desc '
This generator makes the following changes to your application:
    1. Checks that the requested Work is supported by DogBiscuits
    2. Runs the Hyrax generator for the given model
    3. Creates a new model, form and indexer to replace the Hyrax one
    4. Injects properties into the Hyrax-generated presenter
    5. Creates an attribute_rows view file using the configured properties for the work
    6. Updates the schema_org config, blacklight (en) locale and work (en) locale using the configured properties for the work
    7. Updates the catalog controller with the configured properties for the work
       '

  def banner
    say_status("info", "CREATING DOG BISCUITS WORK: #{class_name}", :blue)
    puts options
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
      answer = ask question, default: 'yes'
      unless answer == 'yes'
        say_status("info", "CANCELLING", :red)
        exit 0
      end
    end
  end

  def hyrax_work_generator
    unless options[:force]
      if File.exist? File.join('app/models/', class_path, "#{file_name}.rb")
        question = 'It looks like you ran the Hyrax work generator. Changes to the generated files will be overwritten. Continue?)'
        answer = ask question, default: 'yes'
        unless answer == 'yes'
          say_status("info", "CANCELLING", :red)
          exit 0
        end
      end
    end
    say_status("info", "RUNNING rails generate hyrax:work #{class_name}", :blue)
    generate "hyrax:work #{class_name}", '-f'
  end

  def create_model
    if options[:skip_model]
      say_status("info", "SKIPPING MODEL GENERATION", :blue)
    else
      template('model.rb.erb', File.join('app/models/', class_path, "#{file_name}.rb"))
    end
  end

  def create_indexer
    template('indexer.rb.erb', File.join('app/indexers', class_path, "#{file_name}_indexer.rb"))
  end

  def create_form
    template('form.rb.erb', File.join('app/forms/hyrax', class_path, "#{file_name}_form.rb"))
  end

  # This is the same as the Hyrax file, but we want to ensure we are running against a clean file
  def create_presenter
    template('presenter.rb.erb', File.join('app/presenters/hyrax', class_path, "#{file_name}_presenter.rb"))
  end

  # def biscuitify_form
  #   form = File.join('app/forms/hyrax', class_path, "#{file_name}_form.rb")
  #
  #   gsub_file form, /:resource_type/, ''
  #
  #   injection = "\n\n    self.terms -= DogBiscuits.config.base_properties" +
  #       "\n    self.terms += DogBiscuits.config.#{file_name}_properties" +
  #       "\n    self.required_fields = DogBiscuits.config.#{file_name}_properties_required\n"
  #
  #   inject_into_file form, after: "self.model_class = ::#{class_name}" do
  #     injection unless form.include? injection
  #   end
  # end

  # def biscuitify_model
  #   model = File.join('app/models/', class_path, "#{file_name}.rb")
  #
  #   gsub_file model, /< ActiveFedora::Base/, "< ::DogBiscuits::#{class_name}"
  #
  #   comment_lines model, /include ::Hyrax::BasicMetadata/
  #   inject_into_file model, after: 'Hyrax::BasicMetadata' do
  #     "\n  include DogBiscuits::#{class_name}Metadata"
  #   end
  #   inject_into_file model, before: "\nend" do
  #     "\n  before_save :combine_dates"
  #   end
  # end
  #
  # def biscuitify_indexer
  #   model = File.join('app/indexers/', class_path, "#{file_name}_indexer.rb")
  #
  #   gsub_file model, /< Hyrax::WorkIndexer/, "< ::DogBiscuits::#{class_name}Indexer"
  #
  #   comment_lines model, /include Hyrax::IndexesBasicMetadata/
  #   # TODO leave this in place once this is decoupled from IndexsBasicMetadata
  #   comment_lines model, /include Hyrax::IndexesLinkedMetadata/
  # end

  def update_presenter
    presenter = File.join('app/presenters/hyrax', class_path, "#{file_name}_presenter.rb")
    prepend_file presenter, "# Updated by \n#  `rails generate dog_biscuits:work <%= class_name %>`"

    # Remove basic_metadata so we don't duplicate what's in the WorkShowPresenter
    delegates = DogBiscuits.config.send("#{file_name}_properties") - DogBiscuits.config.base_properties
    injection = "\n    delegate :#{delegates.join(', :')}, to: :solr_document"
    model = "#{class_name}".constantize

    # Append _label onto any controlled properties
    delegates.each do |d|
      if model.controlled_properties.include? d
        injection.gsub!(d, "#{d}_label".to_sym)
      end
    end

    inject_into_file presenter, after: 'Hyrax::WorkShowPresenter' do
      injection
    end unless presenter.include? injection

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

  def update_catalog_controller_for_controlled_properties
    catalog_file = File.join('app/controllers', class_path, 'catalog_controller.rb')
    "#{class_name}".constantize.controlled_properties.each do |prop|
      gsub_file catalog_file, /#{prop}/, "#{prop}_label"
    end
  end

  def display_readme
    readme 'README'
  end

end
