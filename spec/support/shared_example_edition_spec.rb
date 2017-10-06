# frozen_string_literal: true

shared_examples_for 'edition' do
  it 'has edition' do
    expect(stubby.edition).to eq(['First Edition'])
  end
  it 'has edition predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/edition')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:edition)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:edition].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:edition)))
  end
end
