module DogBiscuits
  class GenericWork < Work
    include DogBiscuits::CommonMetadata

            type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

    def generic_work?
      true
    end
  end
end
