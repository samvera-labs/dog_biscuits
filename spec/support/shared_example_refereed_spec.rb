# frozen_string_literal: true

shared_examples_for 'refereed' do
  it 'has refereed' do
    expect(stubby.refereed).to eq([true])
  end
  it 'has refereed predicate' do
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#refereed')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:refereed)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:refereed].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:refereed)))
  end
end
