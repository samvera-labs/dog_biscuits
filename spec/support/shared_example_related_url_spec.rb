# frozen_string_literal: true

shared_examples_for 'related_url' do
  it 'has related url' do
    expect(stubby.related_url).to eq(['http://www.ulcc.ac.uk'])
  end

  it 'has see also predicate' do
    expect(rdf.should(include('http://www.w3.org/2000/01/rdf-schema#seeAlso')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:related_url)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:related_url].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:related_url)))
  end
end
