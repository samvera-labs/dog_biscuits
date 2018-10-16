# DogBiscuits

[![Build Status](https://travis-ci.org/samvera-labs/dog_biscuits.svg?branch=cleanup)](https://travis-ci.org/samvera-labs/dog_biscuits)
[![Coverage Status](https://coveralls.io/repos/github/samvera-labs/dog_biscuits/badge.svg?branch=master)](https://coveralls.io/github/samvera-labs/dog_biscuits?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/10912dcb2451a6c4490c/maintainability)](https://codeclimate.com/github/samvera-labs/dog_biscuits/maintainability)
[![Inline docs](http://inch-ci.org/github/samvera-labs/dog_biscuits.svg?branch=master)](http://inch-ci.org/github/samvera-labs/dog_biscuits)

Models, vocabularies and behaviours for Hyrax applications :dog: :cookie:

## Product Owner

Julie Allinson [geekscruff](https://github.com/geekscruff)

## Current Status (October 2018)

`master` is stable

`latest` contains significant functionality additions (new models, new features), but there is currently an issue with travis due to the length of the build which means the test suite doesn't complete; until this is fixed, `latest` won't be merged into `master`

Refactoring planned in Q4 2018 should reduce the build time.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dog_biscuits/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
