# frozen_string_literal: true

shared_examples_for 'publisher' do
  
  it 'has publisher' do
    expect(stubby.publisher).to eq(['Rough Trade Records'])
  end
  it 'has publisher predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/publisher')))
  end
  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:publisher)))
  end
  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:publisher].should(be_truthy))
  end
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:publisher)))
  end
end
