# frozen_string_literal: true

shared_examples_for 'qualification' do
  # metadata
  it 'has qualification name' do
    expect(stubby.qualification_name).to eq(['qualification'])
  end
  it 'has an qualification level' do
    expect(stubby.qualification_level).to eq(['PhD'])
  end

  # predicates
  it 'has qualification level predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'has qualification name predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationName>')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:qualification_name)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:qualification_name].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:qualification_name)))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:qualification_level)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:qualification_level].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:qualification_level)))
  end
end
