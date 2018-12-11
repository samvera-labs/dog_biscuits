# DogBiscuits

Code: [![Build Status](https://travis-ci.org/samvera-labs/dog_biscuits.svg?branch=cleanup)](https://travis-ci.org/samvera-labs/dog_biscuits)
[![Coverage Status](https://coveralls.io/repos/github/samvera-labs/dog_biscuits/badge.svg?branch=master)](https://coveralls.io/github/samvera-labs/dog_biscuits?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/10912dcb2451a6c4490c/maintainability)](https://codeclimate.com/github/samvera-labs/dog_biscuits/maintainability)
[![Inline docs](http://inch-ci.org/github/samvera-labs/dog_biscuits.svg?branch=master)](http://inch-ci.org/github/samvera-labs/dog_biscuits)
[![Gem Version](https://badge.fury.io/rb/dog_biscuits.svg)](https://badge.fury.io/rb/dog_biscuits)

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
    
The installer adds some new field templates in `views/hyrax/records/edit_fields`:

* abstract - show as a paragraph
* funder - use the crossref fundref autosuggest service
* note - show as a paragraph
* part_of - for JournalArticle use the crossref journals autosuggest service
* publication_status - use a file_based authority (from config/authorities)
* refereeed - show radio buttons for Yes and No
* resource_type_general - use a file_based authority (from config/authorities)

Removing these will default back to standard text field display

## Generate Works

Run the work generator

    $ rails generate dog_biscuits:work WorkName
    
If the work is not supported, the generator will give you a list of supported models.

Add the --skipmodel flag leave the model and indexer unchanged (eg. when you have custom properties in the model and/or custom indexing).

## Configure Works

Edit `config/initializers/dog_biscuits.rb` to configure the properties used by your work - see the comments in that file for details.

## Dates

### Date slider in search results

Add `blacklight_range_limit` by setting the following flag in `config/initializers/dog_biscuits.rb`:

```
config.date_range = true
```

Then run:

    $ rails generate dog_biscuits:dates

### Date picker in edit form

Control date fields with a date picker by setting the following flag in `config/initializers/dog_biscuits.rb`:

```
config.date_picker = true
```

Change which fields are controlled by the picker by changing `config.date_properties` in `config/initializers/dog_biscuits.rb`. The default is all date fields.
 
Then run:

    $ rails generate dog_biscuits:dates

## Documentation

Further documentation is available in the [wiki](https://github.com/samvera-labs/dog_biscuits/wiki).
