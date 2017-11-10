# frozen_string_literal: true

shared_examples_for 'pagination' do
  it 'has pagination' do
    expect(stubby.pagination).to eq(['pagination_test'])
  end
  it 'has pagination predicate' do
    expect(rdf.should(include('http://schema.org/pagination')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:pagination)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:pagination].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:pagination)))
  end
end
