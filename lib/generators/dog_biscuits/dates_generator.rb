# frozen_string_literal: true

class DogBiscuits::DatesGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator .
  1. configures the date_picker, if config.date_picker is true;
       it adds a form partial for all dates in config.date_picker_dates.
  2. Configures the date_range in blacklight, if config.date_range is true.
       '

  def banner
    say_status("info", "Configuring the date_picker and date_range", :blue)
  end

  # rubocop:disable Style/GuardClause
  def date_picker
    if DogBiscuits.config.date_picker == true

      gem 'bootstrap-datepicker-rails'

      Bundler.with_clean_env do
        run "bundle install --without development test"
      end

      # insert into application.css
      css = '*= require bootstrap-datepicker'
      unless File.read('app/assets/stylesheets/application.css').include? css
        inject_into_file 'app/assets/stylesheets/application.css', before: "*= require_self" do
          "#{css}\n"
        end
      end

      # insert into application.js
      js = '//= require bootstrap-datepicker'
      unless File.read('app/assets/javascripts/application.js').include? js
        inject_into_file 'app/assets/javascripts/application.js', after: " //= require_tree ." do
          "\n #{js}"
        end
      end

      DogBiscuits.config.date_picker_dates.each do |date|
        copy_file '_date_template.html.erb', "app/views/records/edit_fields/_#{date}.html.erb"
      end
    end
  end

  def date_range
    if DogBiscuits.config.date_range == true

      gem "blacklight_range_limit"

      Bundler.with_clean_env do
        run "bundle install --without development test"
      end

      generate 'blacklight_range_limit:install' unless File.read('config/routes.rb').include? 'range_searchable'

      copy_file 'config/initializers/catalog_search_builder_overrides.rb', 'config/initializers/catalog_search_builder_overrides.rb'

      catalog = "    config.add_facet_field 'date_range_sim', label: 'Date Range', range: true"

      unless File.read('app/controllers/catalog_controller.rb').include? catalog
        inject_into_file 'app/controllers/catalog_controller.rb', before: '    # replace facets end' do
          "#{catalog}\n"
        end
      end

      range = "          #date_range_sim: #{DogBiscuits.config.property_mappings[:date_range][:label]}\n"

      unless File.read('config/locales/hyrax.en.yml').include? range
        inject_into_file 'config/locales/hyrax.en.yml', after: "        facet:\n" do
          range
        end
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
