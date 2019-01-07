# frozen_string_literal: true

class DogBiscuits::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
         1. Adds dog_biscuits initializer and config
         2. Includes DogBiscuits::ExtendedSolrDocument in the SolrDocument
         3. Runs the authorities, locales and schema_org generators
         4. Adds various new files into app/
         5. Runs the dates generator if date_picker or date_range are true
       '

  def banner
    say_status("info", "Generating DogBiscuits installation", :blue)
  end

  def create_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    yml_path = 'config/dog_biscuits.yml'

    copy_file 'config/dog_biscuits.yml', yml_path unless File.exist?(yml_path) && !options[:force]
    copy_file 'config/initializers/dog_biscuits.rb', init_path unless File.exist?(init_path) && !options[:force]
  end

  # copy all new files in app
  def create_app
    directory 'app', 'app'
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
    generate 'dog_biscuits:authority'
  end

  def create_helpers
    db_injection = '  include ::DogBiscuitsHelper'
    unless File.read('app/helpers/hyrax_helper.rb').include? db_injection
      inject_into_file 'app/helpers/hyrax_helper.rb', after: "Hyrax::HyraxHelperBehavior\n" do
        "#{db_injection}\n"
      end
    end
  end
  
  # Make sure range is in place, if we're running install again, it could remove it
  def generate_dates
    if DogBiscuits.config.date_range || DogBiscuits.config.date_picker
      generate('dog_biscuits:dates')
    end
  end
  
  # Remove all blacklight labels from hyrax locales
  def wipe_hyrax_locales
    Dir.entries('config/locales').select { |file| file.start_with?('hyrax.') }.each do |locale|
      gsub_file "config/locales/#{locale}", /        index:(.*)        show:/m, "        index:\n        show:"
      gsub_file "config/locales/#{locale}", /        facet:(.*)        index:/m, "        facet:\n        index:"
      gsub_file "config/locales/#{locale}", /        show:(.*)  hyrax:/m, "        show:\n  hyrax:"
    end
  end
  
  def generate_locales
    generate 'dog_biscuits:locales', '-f'
  end
  
  def create_schema_org
    generate 'dog_biscuits:schema_org'
  end

end
