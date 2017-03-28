module DogBiscuits
  # thumbnail url
  # FIXME: remove when this becomes redundant
  module ThumbnailUrl
    extend ActiveSupport::Concern

    included do
      property :thumbnail_url,
               predicate: ::RDF::URI.new('http://schema.org/thumbnailUrl'),
               multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
