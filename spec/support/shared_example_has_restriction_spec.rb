# frozen_string_literal: true

shared_examples_for 'has_restriction' do
  it 'has restriction' do
    expect(stubby.has_restriction).to eq(['10 years from last access'])
  end
  it 'has restriction predicate' do
    expect(rdf.should(include('http://www.loc.gov/premis/rdf/v1#hasRestriction')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:has_restriction)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:has_restriction].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:has_restriction)))
  end
end
