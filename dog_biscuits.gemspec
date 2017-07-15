# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'dog_biscuits/version'

Gem::Specification.new do |spec|
  spec.name          = 'dog_biscuits'
  spec.version       = DogBiscuits::VERSION
  spec.authors       = ['Julie Allinson']
  spec.email         = ['julie.allinson@london.ac.uk']

  spec.summary       = 'DogBiscuits provides re-usable models, vocabularies and other services for Hyrax applications.'
  spec.description   = 'DogBiscuits provides re-usable models, vocabularies and other services for Hyrax applications.'
  spec.homepage      = 'https://github.com/geekscruff/dog_biscuits'
  spec.license       = 'APACHE2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hyrax', '~> 1.0'

  spec.add_development_dependency 'engine_cart', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rspec-rails', '~> 3.1'
  spec.add_development_dependency "factory_girl_rails", '~> 4.4'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'solr_wrapper'
  spec.add_development_dependency 'fcrepo_wrapper'
end
