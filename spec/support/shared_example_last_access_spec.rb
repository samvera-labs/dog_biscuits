# frozen_string_literal: true

shared_examples_for 'last_access' do
  it 'has last_access' do
    expect(stubby.last_access).to eq('2016-01-01')
  end
  it 'has last_access predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#lastAccess')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:last_access)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:last_access].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:last_access)))
  end
end
