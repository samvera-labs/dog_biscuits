# frozen_string_literal: true

class DogBiscuits::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Adds a dog_biscuits initializer in config/initializers/dog_biscuits.rb.
  2. Adds a dog_biscuits config in config/dog_biscuits.yml.
  3. Includes DogBiscuits::ExtendedSolrDocument in the SolrDocument
  4. Runs the authorities, edit_fields_and_inputs and schema_org generators
  5. Adds the LocalFormMetadataService
  6. Adds two view files as a temporary fix.
       '

  def banner
    say_status("info", "Generating DogBiscuits installation", :blue)
  end

  def create_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    yml_path = 'config/dog_biscuits.yml'

    copy_file 'config/dog_biscuits.yml', yml_path unless File.exist?(yml_path)

    copy_file 'config/initializers/dog_biscuits.rb', init_path unless File.exist?(init_path)
  end

  def update_initializer
    gsub_file 'config/initializers/dog_biscuits.rb', /#   Available models are:/, "#   Available models are: #{DogBiscuits.config.available_models.join(', ')}"
  end

  def update_solr_document
    solr_doc = 'app/models/solr_document.rb'
    unless solr_doc.include? 'DogBiscuits::ExtendedSolrDocument'
      inject_into_file solr_doc, after: 'include Hyrax::SolrDocumentBehavior' do
        "\n  include DogBiscuits::ExtendedSolrDocument"
      end
    end
  end

  def create_authorities
    generate 'dog_biscuits:authority', '-f'
  end

  def create_local_form_metadata_service
    copy_file 'services/local_form_metadata_service.rb', 'app/services/local_form_metadata_service.rb'
  end

  def create_schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

  def create_edit_fields_and_inputs
    directory 'views/records', 'app/views/records'
  end

  # TODO: remove when fixed
  def create_views
    copy_file 'views/hyrax/base/_work_description.erb', 'app/views/hyrax/base/_work_description.erb'
    copy_file 'views/shared/_citations.html.erb', 'app/views/shared/_citations.html.erb'
  end
end
