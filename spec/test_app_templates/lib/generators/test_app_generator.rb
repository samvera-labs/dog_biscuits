# frozen_string_literal: true

require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root './spec/test_app_templates'

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application
  
  def require_bootsnap
    inject_into_file 'config/boot.rb', after: "require 'bundler/setup' # Set up gems listed in the Gemfile.\n" do
      "require 'bootsnap/setup'\n"
    end
  end

  def install_hyrax
    gem 'hyrax', '>= 2', '< 3'
    run 'bundle install'
    generate 'hyrax:install', '-f'
  end
  
  # required for restricted properties
  def install_hydra_role_management
    gem 'hydra-role-management'
    run 'bundle install'
    generate('roles')
    rake('db:migrate')
  end

  # Fix for running on vagrant on windows with nfs
  def configure_tmp_directory
    if ENV['USER'] == 'vagrant'
      injection = "\n  # Relocate RAILS_TMP"
      injection += "\n  config.assets.configure do |env|"
      injection += "\n    env.cache = Sprockets::Cache::FileStore.new("
      injection += "\n      ENV['RAILS_TMP'] + '/cache/assets'"
      injection += "\n    )"
      injection += "\n  end if ENV['RAILS_TMP']"

      inject_into_file 'config/application.rb', after: '# -- all .rb files in that directory are automatically loaded.' do
        injection
      end
      # assumes use of rbenv
      run 'touch .rbenv-vars'
      run 'echo "RAILS_TMP=/tmp" >> .rbenv-vars'
      run 'rbenv vars'
    end
  end
  # end of methods running only on localhost

  def install_dog_biscuits
    generate 'dog_biscuits:install', '-f'
    DogBiscuits.config.available_models.each do |model|
      generate "dog_biscuits:work #{model}", '-f'
    end
  end
end
