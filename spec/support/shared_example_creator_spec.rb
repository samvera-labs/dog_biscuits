# frozen_string_literal: true

shared_examples_for 'creator' do
  it 'has creator' do
    expect(stubby.creator).to eq(['Marr, Johnny'])
  end
  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/creator')))
  end
  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:creator)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:creator].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:creator)))
  end
end
