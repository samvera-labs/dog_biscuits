# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run style checker'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = false
end

desc "Run continuous integration build"
task ci: ['engine_cart:generate'] do
  # Rake::Task['solr_fcrepo_ci'].invoke
  Rake::Task['spec'].invoke
end

desc 'Run continuous integration build'
task ci: ['rubocop', 'start_solr_fcrepo_ci', 'spec', 'kill_solr_fcrepo']

task default: :ci

task :start_solr_fcrepo do
  Rake::Task['kill_solr_fcrepo'].invoke
  within_test_app do
    system "solr_wrapper clean"
  end
  system "sleep 10"
  within_test_app do
    system "solr_wrapper &"
  end
  within_test_app do
    system "fcrepo_wrapper &"
  end
end

task :start_solr_fcrepo_ci do
  Rake::Task['kill_solr_fcrepo'].invoke
  within_test_app do
    system "solr_wrapper --config config/solr_wrapper_test.yml clean"
  end
  system "sleep 10"
  within_test_app do
    system "solr_wrapper --config config/solr_wrapper_test.yml &"
  end
  within_test_app do
    system "fcrepo_wrapper --config config/fcrepo_wrapper_test.yml &"
  end
  system "sleep 60"
end

task :kill_solr_fcrepo do
  system "pkill -f fcrepo_wrapper"
  system "pkill -f solr_wrapper"
  system "sleep 10"
end
