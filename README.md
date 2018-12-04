# DogBiscuits

Code: [![Build Status](https://travis-ci.org/samvera-labs/dog_biscuits.svg?branch=cleanup)](https://travis-ci.org/samvera-labs/dog_biscuits)
[![Coverage Status](https://coveralls.io/repos/github/samvera-labs/dog_biscuits/badge.svg?branch=master)](https://coveralls.io/github/samvera-labs/dog_biscuits?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/10912dcb2451a6c4490c/maintainability)](https://codeclimate.com/github/samvera-labs/dog_biscuits/maintainability)
[![Inline docs](http://inch-ci.org/github/samvera-labs/dog_biscuits.svg?branch=master)](http://inch-ci.org/github/samvera-labs/dog_biscuits)

Docs: 
[![Documentation](http://img.shields.io/badge/DOCUMENTATION-wiki-blue.svg)](https://github.com/samvera-labs/dog_biscuits/wiki)
[![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![Apache 2.0 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)

Models, vocabularies and behaviours for Hyrax applications :dog: :cookie:

## Product Owner

Julie Allinson [geekscruff](https://github.com/geekscruff)

## Installation

For use within [Hyrax 2](https://github.com/samvera/hyrax) applications. 

Add this line to your application's Gemfile:

```ruby
gem 'dog_biscuits', :git => 'git://github.com/geekscruff/dog_biscuits.git'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dog_biscuits

Run the generator

    $ rails generate dog_biscuits:install

Add the -f flag to overwrite any existing files with new ones.

## Generate Works

Run the work generator

    $ rails generate dog_biscuits:work WorkName
    
If the work is not supported, the generator will give you a list of supported models.

Add the -f flag to overwrite any existing files with new ones.

Add the --skipmodel flag to overwrite any existing files but leave the model and indexer unchanged (eg. when you have custom properties in the model and/or custom indexing).

## Documentation

Further documentation is available in the [wiki](https://github.com/samvera-labs/dog_biscuits/wiki).
