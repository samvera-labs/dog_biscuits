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
  Rake::Task['spec'].invoke
end

# FcrepoWrapper.default_instance(port: 8984)
#
# task ci: ['fcrepo:start'] do
#   Rake::Task['spec'].invoke
# end

# task ci: ['solr:start'] do
#   Rake::Task['spec'].invoke
# end

within_test_app do
  system "solr_wrapper clean"
  system "solr_wrapper &"
  system "fcrepo_wrapper &"
end

desc 'Run continuous integration build'
task ci: ['rubocop', 'spec']

task default: :ci
