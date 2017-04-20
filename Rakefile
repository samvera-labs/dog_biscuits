# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# Don't know how to require the hydra.rake task
# Should be able to use solr_wrapper but I can't work out how to create a collection
# require 'solr_wrapper/rake_task'
# SolrWrapper.default_instance_options = {
#   verbose: true,
#   cloud: true,
#   port: '8985',
#   version: '6.5.0',
#   instance_dir: 'tmp',
#   download_dir: 'tmp',
# }
# require 'fcrepo_wrapper/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run style checker'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = true
end

desc 'Run continuous integration build'
task ci: ['engine_cart:generate'] do
  Rake::Task['spec'].invoke
end

# Because the specs create 'real' objects, solr and fcrepo must be running
desc 'Run continuous integration build'
task ci: ['kill_sf_test', 'start_sf_test', 'rubocop', 'spec']

task default: :ci

# Tasks for starting and stopping solr and fcrepo
task :start_sf do
  Rake::Task['kill_sf'].invoke
  within_test_app do
    sh 'solr_wrapper &'
  end
  within_test_app do
    sh 'fcrepo_wrapper &'
  end
end

# These are awful, but I couldn't work out how to do this properly
task :start_sf_test do
  within_test_app do
    sh 'solr_wrapper --config config/solr_wrapper_test.yml & sleep 90'
  end
  within_test_app do
    sh 'fcrepo_wrapper --config config/fcrepo_wrapper_test.yml & sleep 60'
  end
end

# Don't use sh, it will exit if the command fails and it's OK for these to fail.
task :kill_sf_test do
  within_test_app do
    system 'tmp/solr-test/bin/solr stop -p 8985 & sleep 10'
    system 'pkill -f fcrepo_wrapper'
    system 'rm -r tmp/fcrepo4*'
  end
  within_test_app do
    system 'solr_wrapper --config config/solr_wrapper_test.yml clean'
  end
end

# Kills fcrepo_wrapper and solr_wrapper in either test or dev mode; cleanss up data
task :kill_sf do
  within_test_app do
    system 'tmp/solr-development/bin/solr stop -p 8983'
    system 'tmp/solr-test/bin/solr stop -p 8985'
    system 'pkill -f fcrepo_wrapper'
    system 'rm -r tmp/fcrepo4*'
  end
  within_test_app do
    system 'solr_wrapper clean'
    system 'solr_wrapper --config config/solr_wrapper_test.yml clean'
  end
end
