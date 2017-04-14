# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

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

desc 'Run continuous integration build'
task ci: ['rubocop', 'kill_sf_ci', 'start_sf_ci', 'spec', 'kill_sf_ci']

task default: :ci

task :start_sf do
  Rake::Task['kill_sf'].invoke
  within_test_app do
    system 'solr_wrapper &'
  end
  within_test_app do
    system 'fcrepo_wrapper &'
  end
end

task :start_sf_ci do
  within_test_app do
    system 'solr_wrapper --config config/solr_wrapper_test.yml & sleep 60'
  end
  within_test_app do
    system 'fcrepo_wrapper --config config/fcrepo_wrapper_test.yml & sleep 30'
  end
end

task :kill_sf_ci do
  within_test_app do
    system 'tmp/solr-test/bin/solr stop -p 8985 & sleep 10'
    system 'pkill -f fcrepo_wrapper'
  end
  within_test_app do
    system 'solr_wrapper --config config/solr_wrapper_test.yml clean'
  end
end

task :kill_sf do
  within_test_app do
    system 'tmp/solr-development/bin/solr stop -p 8983'
    system 'pkill -f fcrepo_wrapper'
  end
  within_test_app do
    system 'solr_wrapper clean'
  end
end
