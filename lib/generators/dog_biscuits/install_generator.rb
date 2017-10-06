# frozen_string_literal: true

class DogBiscuits::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Generating DogBiscuits installation", :blue)
  end

  def setup_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    yml_path = 'config/dog_biscuits.yml'

    unless File.exist?(yml_path)
      copy_file 'config/dog_biscuits.yml', yml_path
    end

    unless File.exist?(init_path)
      copy_file 'config/initializers/dog_biscuits.rb', init_path
    end
  end

  def solr_document
    solr_doc = 'app/models/solr_document.rb'
    unless solr_doc.include? 'DogBiscuits::ExtendedSolrDocument'
      inject_into_file solr_doc, after: 'include Hyrax::SolrDocumentBehavior' do
        "\n  include DogBiscuits::ExtendedSolrDocument"
      end
    end
  end

  def authority
    generate 'dog_biscuits:authority', '-f'
  end

  def edit_fields_and_inputs
    generate 'dog_biscuits:edit_fields_and_inputs', '-f'
  end

  def schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end
end
