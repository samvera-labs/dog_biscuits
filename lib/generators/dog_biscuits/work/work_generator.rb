require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::WorkGenerator < Rails::Generators::NamedBase

  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "CREATING DOG BISCUITS WORK: #{class_name}", :blue)
  end

  def hyrax_generator_run
    if File.exist? File.join('app/models/', class_path, "#{class_name.underscore}.rb")
      answer = ask('It looks like you have already run the Hyrax generator. Any changes to the generated files will be overwritten. Is that OK? (y/n)').underscore
      unless answer == 'y'
        say_status("warn", "CANCELLED CREATING: #{class_name}", :orange)
        exit 0
      end
    end
    say_status("info", "RUNNING THE HYRAX GENERATOR: rails generate hyrax:work #{class_name}", :green)
    generate "hyrax:work #{class_name}", '-f'
  end

  def supported_model
    unless DogBiscuits.config.available_models.include? class_name
      say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect {|m| m}.join(', ') }", :red)
      exit 0
    end
  end

  def biscuitify_form
    form = File.join('app/forms/hyrax', class_path, "#{class_name.underscore}_form.rb")

    gsub_file form, /:resource_type/, ''

    injection = "\n\n    self.terms -= DogBiscuits.config.base_properties" +
        "\n    self.terms += DogBiscuits.config.#{class_name.underscore}_properties" +
        "\n    self.required_fields = DogBiscuits.config.#{class_name.underscore}_properties_required\n"

    inject_into_file form, after: "self.model_class = ::#{class_name}" do
      injection unless form.include? injection
    end
  end

  def biscuitify_model
    model = File.join('app/models/', class_path, "#{class_name.underscore}.rb")

    gsub_file model, /< ActiveFedora::Base/, "< ::DogBiscuits::#{class_name}"

    comment_lines model, /include ::Hyrax::BasicMetadata/
    inject_into_file model, after: 'Hyrax::BasicMetadata' do
      "\n  include DogBiscuits::#{class_name}Metadata"
    end
    inject_into_file model, before: "\nend" do
      "\n  before_save :combine_dates"
    end
    # inject indexer
    # inject metadata
  end

  def biscuitify_indexer
    model = File.join('app/indexers/', class_path, "#{class_name.underscore}_indexer.rb")

    gsub_file model, /< Hyrax::WorkIndexer/, "< ::DogBiscuits::#{class_name}Indexer"

    comment_lines model, /include Hyrax::IndexesBasicMetadata/
    # TODO remove this line once this is decoupled from IndexsBM
    comment_lines model, /include Hyrax::IndexesLinkedMetadata/
  end

  def biscuitify_presenter
    presenter = File.join('app/presenters/hyrax', class_path, "#{class_name.underscore}_presenter.rb")

    # Don't duplicate what's in the WorkShowPresenter
    # TODO: this will mess up when things have changed and it's run again
    delegates = DogBiscuits.config.send("#{class_name.underscore}_properties") - DogBiscuits.config.base_properties - [:resource_type]
    injection = "\n    delegate :#{delegates.join(', :')}, to: :solr_document"
    # Append _label onto any controlled properties
    model = "#{class_name}".constantize
    delegates.each do |d|
      if model.controlled_properties.include? d
        injection.gsub!(d, "#{d}_label".to_sym)
      end
    end

    inject_into_file presenter, after: 'Hyrax::WorkShowPresenter' do
      injection
    end unless presenter.include? injection

  end

  def biscuitify_attribute_rows
    generate "dog_biscuits:attribute_rows #{class_name}", '-f'
  end

  def biscuitify_locales
    generate "dog_biscuits:locales #{class_name}", '-f'
  end

  # Regenerate schema.org from updated dog_biscuits.yml
  def schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

  # Regenerate the whole catalog_controller
  def catalog_controller
    generate 'dog_biscuits:catalog_controller', '-f'
  end

  def controlled_properties
    catalog_file = File.join('app/controllers', class_path, 'catalog_controller.rb')
    "#{class_name}".constantize.controlled_properties.each do |prop|
      gsub_file catalog_file, /#{prop}/, "#{prop}_label"
      gsub_file catalog_file, /config.add_search_field('#{prop}_label')/, "config.add_search_field('#{prop}')"
    end
  end

  def display_readme
    readme 'README'
  end

end
