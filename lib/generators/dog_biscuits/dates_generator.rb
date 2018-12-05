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
    say_status("info", "date_picker is disabled and will not be installed", :blue) unless DogBiscuits.config.date_picker
    say_status("info", "date_range is disabled and will not be installed", :blue) unless DogBiscuits.config.date_range
  end

  # rubocop:disable Style/GuardClause
  def date_picker
    if DogBiscuits.config.date_picker

      gem 'bootstrap-datepicker-rails'

      Bundler.with_clean_env do
        run "bundle install"
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
    if DogBiscuits.config.date_range
      
      gem "blacklight_range_limit"
      
      Bundler.with_clean_env do
        run "bundle install"
      end
      generate 'blacklight_range_limit:install'
      copy_file 'config/initializers/catalog_search_builder_overrides.rb', 'config/initializers/catalog_search_builder_overrides.rb'
    end
  end


  # In Hyku, the blacklight_range_limit javascript inserts jquery, this causes other js to fail cos of multiple loads
  #  (eg. add work modal doesn't work)
  # To fix this, remove the standard insert from blacklight_range_limit to remove jquery
  #   and add the require statements individually
  #   do this earlier in the file because in production, the blacklight_range_limit js doesn't work if it's at the bottom
  # This is a bit ugly and fragile.
  def date_range_js
    if File.exist?('config/initializers/version.rb') && File.read('config/initializers/version.rb').include?('Hyku')
      unless File.read('app/assets/javascripts/application.js').include? "//= require 'blacklight_range_limit'\n// Moved the Hyku JS *above* the Hyrax JS"
        rangejs = "// For blacklight_range_limit built-in JS, if you don't want it you don't need\n"
        rangejs += "// this:\n"
        rangejs += "//= require 'blacklight_range_limit'"

        rangejs_altered = "// For blacklight_range_limit built-in JS, if you don't want it you don't need\n"
        rangejs_altered += "// this:\n"
        rangejs_altered += "// require 'blacklight_range_limit'\n"

        rangejs_new = "\n//= require 'flot/jquery.flot.js'\n"
        rangejs_new += "//= require 'flot/jquery.flot.selection.js'\n"
        rangejs_new += "//= require 'bootstrap-slider'\n"
        rangejs_new += "//= require 'blacklight_range_limit/range_limit_distro_facets.js'\n"
        rangejs_new += "//= require 'blacklight_range_limit/range_limit_shared.js'\n"
        rangejs_new += "//= require 'blacklight_range_limit/range_limit_slider.js'\n\n"

        gsub_file 'app/assets/javascripts/application.js', rangejs, rangejs_altered

        inject_into_file 'app/assets/javascripts/application.js', before: "// Moved the Hyku JS *above* the Hyrax JS" do
          rangejs_new
        end
      end
    end
  end
  # rubocop:enable Style/GuardClause
end
