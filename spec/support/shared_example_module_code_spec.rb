# frozen_string_literal: true

shared_examples_for 'module_code' do
  it 'has former module code' do
    expect(stubby.module_code).to eq(['XXXXXX'])
  end
  it 'has module code predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#moduleCode')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:module_code)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:module_code].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:module_code)))
  end
end
