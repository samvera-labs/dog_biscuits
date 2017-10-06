require 'rails/generators'
require 'rails/generators/model_helpers'

class DogBiscuits::WorkGenerator < Rails::Generators::NamedBase

  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "CREATING DOG BISCUITS WORK: #{class_name}", :blue)
  end

  def hyrax_generator_run
    unless File.exist? File.join('app/models/', class_path, "#{class_name.underscore}.rb")
      say_status("error", "PLEASE RUN THE HYRAX WORK GENERATOR BEFORE RUNNING THE DOG BISCUITS ONE: rails generate hyrax:work #{class_name}", :red)
      exit 0
    end
  end

  def supported_model
    unless DogBiscuits.config.available_models.include? class_name.underscore
      say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect {|m| m.camelize}.join(', ') }", :red)
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
    gsub_file model, /self.indexer = #{class_name}/, "self.indexer = DogBiscuits::#{class_name}"

    comment_lines model, /include ::Hyrax::BasicMetadata/
    inject_into_file model, after: 'Hyrax::BasicMetadata' do
      "\n  include DogBiscuits::#{class_name}Metadata"
    end
    # inject indexer
    # inject metadata
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

  # TODO: add depositor, proxy_depositor, embargo_release_date, lease_expiration_date?
  # TODO: more complex renderings
  def biscuitify_attribute_rows
    attributes_file = File.join('app/views/hyrax', class_path, "#{class_name.underscore.pluralize}/_attribute_rows.html.erb")
    copy_file '_attribute_rows.html.erb', attributes_file

    injection = ''
    DogBiscuits.config.send("#{class_name.underscore}_properties").each do |term|
      # Append _label onto any controlled properties
      # if "#{class_name}".constantize.controlled_properties.include? term
      #   injection += "\n<%= presenter.attribute_to_html(:#{term}_label) %>"
      if term.to_s.include? 'url'
        injection += "\n<%= presenter.attribute_to_html(:#{term}, render_as: :external_link) %>"
      elsif DogBiscuits.config.facet_properties.include? term
        injection += "\n<%= presenter.attribute_to_html(:#{term}, render_as: :faceted) %>"
      else
        injection += "\n<%= presenter.attribute_to_html(:#{term}) %>"
      end
    end

    inject_into_file attributes_file, after: '# display fields for show page' do
      injection unless attributes_file.include? injection
    end
  end

  def biscuitify_locales
    local_properties = DogBiscuits.config.send("#{class_name.underscore}_properties") - DogBiscuits.config.base_properties - [:resource_type]
    append_block = "\n  simple_form:\n    hints:\n"
    append_block += "    defaults:\n"

    local_properties.each do |prop|
      if DogBiscuits.config.property_mappings[prop]
        if DogBiscuits.config.property_mappings[prop][:help_text]
          append_block += "      #{prop}: '#{DogBiscuits.config.property_mappings[prop][:help_text]}'\n"
        end
      end
    end
    append_block += "    labels:\n"

    local_properties.each do |prop|
      if DogBiscuits.config.property_mappings[prop]
        if DogBiscuits.config.property_mappings[prop][:label]
          append_block += "      #{prop}: '#{DogBiscuits.config.property_mappings[prop][:label]}'\n"
        end
      end
    end

    append_file "config/locales/#{class_name.underscore}.en.yml", append_block

  end

  # Regenerate schema.org from updated dog_biscuits.yml
  # TODO this does not work
  def schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

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
