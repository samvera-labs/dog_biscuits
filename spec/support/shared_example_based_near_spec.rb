# frozen_string_literal: true

shared_examples_for 'based_near' do
  
  it 'has based_near' do
    expect(stubby.based_near).to eq(['Sheffield'])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/based_near')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:based_near)))
    expect(solr_doc.should(respond_to(:based_near_label)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:based_near_label].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:based_near)))
  end
end
