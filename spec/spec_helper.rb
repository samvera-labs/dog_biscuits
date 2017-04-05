# spec/spec_helper.rb
require 'simplecov'

# TODO REVIEW

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/.internal_test_app'
end

#$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# as of webmock v2 this has to go here, after load path and before other requires
require 'webmock/rspec'
require 'factory_girl_rails'
require 'engine_cart'

EngineCart.load_application!
require 'byebug' unless ENV['TRAVIS']

require 'jquery-rails'
require 'coffee-rails'
require 'bootstrap-sass'
require 'turbolinks'
require 'sqlite3'
require 'devise'
require 'listen'

WebMock.disable_net_connect!(allow_localhost: true)

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

require 'active_fedora/cleaner'
RSpec.configure do |config|
  # ???
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.before(:suite) do
    # can we run wrappers here?
  end
  config.before(:each) do
    # ???
  end
  config.after(:suite) do
    ActiveFedora::Cleaner.clean!
  end
  # Include shared examples for concerns
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
