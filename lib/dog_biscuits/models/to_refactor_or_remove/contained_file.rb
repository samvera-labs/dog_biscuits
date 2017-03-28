require 'active_fedora/noid'

class ContainedFile < ActiveFedora::File
  include ActiveFedora::WithMetadata, Hyrax::Noid

  metadata do
    include DCTerms, RdfType, SkosLabels
    configure type: RDF::URI.new('http://pcdm.org/models#File')
    configure type: RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#All')
  end
end
