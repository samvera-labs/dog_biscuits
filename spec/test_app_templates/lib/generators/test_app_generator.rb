# frozen_string_literal: true

require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root './spec/test_app_templates'

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  # FROM template.rb
  def install_hyrax
    gem 'hyrax', '2.0.0.rc1'
    run 'bundle install'
    generate 'hyrax:install', '-f'
    rails_command 'db:migrate'
  end

  # These two methods should only run on local boxes (localhost)
  #  they relate to vagrant performance
  def configure_tmp_directory
    # Don't do this on travis
    if `hostname`.include? 'localhost'

      injection = "\n  # Relocate RAILS_TMP"
      injection += "\n  config.assets.configure do |env|"
      injection += "\n    env.cache = Sprockets::Cache::FileStore.new("
      injection += "\n      ENV['RAILS_TMP'] + '/cache/assets'"
      injection += "\n    )"
      injection += "\n  end"

      inject_into_file 'config/environments/test.rb', after: '# Settings specified here will take precedence over those in config/application.rb.' do
        injection
      end
      inject_into_file 'config/environments/development.rb', after: '# Settings specified here will take precedence over those in config/application.rb.' do
        injection
      end
    end
  end

  def configure_rails_tmp_env
    # Don't do this on travis
    if `hostname`.include? 'localhost'
      run 'mkdir ~/tmp'
      run 'touch .rbenv-vars'
      run 'echo "RAILS_TMP=~/tmp" >> .rbenv-vars'
      run 'rbenv vars'
    end
  end

  def configure_log_path
    # Don't do this on travis
    if `hostname`.include? 'localhost'

      run 'mkdir ~/log'

      injection = "\n  # Relocate log to ~/log"
      injection += "\n  config.log_path = '~/tmp'"

      inject_into_file 'config/environments/test.rb', after: '# Settings specified here will take precedence over those in config/application.rb.' do
        injection
      end
      inject_into_file 'config/environments/development.rb', after: '# Settings specified here will take precedence over those in config/application.rb.' do
        injection
      end
    end
  end

  def install_dog_biscuits
    generate 'dog_biscuits:install', '-f'
    DogBiscuits.config.available_models.each do |model|
      generate "dog_biscuits:work #{model}", '-f'
    end
    # I don't know why, but this fails so just do it again
    generate "dog_biscuits:work ConferenceItem", '-f'
  end
end
