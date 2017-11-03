# DogBiscuits

[![Coverage Status](https://coveralls.io/repos/github/ULCC/dog_biscuits/badge.svg?branch=master)](https://coveralls.io/github/ULCC/dog_biscuits?branch=master)
[![Build Status](https://travis-ci.org/ULCC/dog_biscuits.svg?branch=cleanup)](https://travis-ci.org/ULCC/dog_biscuits)
[![Dependency Status](https://gemnasium.com/badges/github.com/ULCC/dog_biscuits.svg)](https://gemnasium.com/github.com/ULCC/dog_biscuits)
[![Inline docs](http://inch-ci.org/github/ULCC/dog_biscuits.svg?branch=master)](http://inch-ci.org/github/ULCC/dog_biscuits)

Models, vocabularies and behaviours for Hyrax applications :dog: :cookie:


## Installation

For use within [Hyrax 2](https://github.com/samvera/hyrax) applications. 

This branch will become master once Hyrax 2 is released.

Add this line to your application's Gemfile:

```ruby
gem 'dog_biscuits', :git => 'git://github.com/geekscruff/dog_biscuits.git', branch: 'hyrax2'
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

Add the --skip_model flag to overwrite any existing files but leave the model and indexer unchanged.

## Documentation

Further documentation is available in the [wiki](https://github.com/ULCC/dog_biscuits/wiki).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dog_biscuits/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
