# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task :solr_fcrepo_ci do
  within_test_app do
    system "solr_wrapper --config config/solr_wrapper_test.yml clean &"
    system "sleep 30"
    system "solr_wrapper --config config/solr_wrapper_test.yml &"
    system "sleep 60"
    system "fcrepo_wrapper  --config config/fcrepo_wrapper_test.yml &"
    system "sleep 60"
  end
end

task :kill_solr_fcrepo do
  system "pkill -f _wrapper"
end

RSpec::Core::RakeTask.new(:spec)

desc 'Run style checker'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = true
end

desc "Run continuous integration build"
task ci: ['engine_cart:generate'] do
  # Rake::Task['solr_fcrepo_ci'].invoke
  Rake::Task['spec'].invoke
end

desc 'Run continuous integration build'
task ci: ['rubocop', 'kill_solr_fcrepo', 'solr_fcrepo_ci', 'spec', 'kill_solr_fcrepo']

task default: :ci
