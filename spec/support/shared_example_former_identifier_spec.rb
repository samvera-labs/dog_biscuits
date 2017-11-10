# frozen_string_literal: true

shared_examples_for 'former_identifier' do
  it 'has former identifier' do
    expect(stubby.former_identifier).to eq(['york:1234'])
  end
  it 'has former identifier predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#formerIdentifier')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:former_identifier)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:former_identifier].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:former_identifier)))
  end
end
