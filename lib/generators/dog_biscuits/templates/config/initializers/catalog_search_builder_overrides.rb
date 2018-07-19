# frozen_string_literal: true
# ./config/initializers/catalog_search_builder_overrides.rb
# via https://github.com/samvera/hyrax/issues/707

# Unclear how to customize the Sufia::CatalogSearchBuilder, which
# we need to do for blacklight_range_limit.
# https://github.com/projecthydra-labs/hyrax/issues/707

# to_prepare used in case there's dev-mode class reloading of the
# thing we're patching. But we try to check to not do it multiple
# times in case there isn't.
Rails.application.config.to_prepare do
  # would like to look up the class dynamically in case it changes,
  # Sufia does this weird making this the only way, Hyrax is somewhat
  # less weird.
  klass = CatalogController.new.search_builder_class
  klass.send(:include, BlacklightRangeLimit::RangeLimitBuilder) unless klass.ancestors.include? BlacklightRangeLimit::RangeLimitBuilder
end
