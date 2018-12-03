# frozen_string_literal: true

shared_examples_for 'managing_organisation' do
  
  it 'has managing organisation' do
    expect(stubby.managing_organisation).to eq(['Managing Organisation'])
  end
  it 'has managing organisation predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/pure#pureManagingUnit')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should respond_to(:managing_organisation))
  end
  
  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:managing_organisation].should be_truthy)
  end
  
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:managing_organisation))
  end
end
