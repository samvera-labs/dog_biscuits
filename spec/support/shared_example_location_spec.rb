# frozen_string_literal: true

shared_examples_for 'location' do
  it 'has abstract' do
    expect(stubby.location).to eq(['The Hacienda, Manchester'])
  end

  it 'has location predicate' do
    expect(rdf.should(include('http://schema.org/location')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:location)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:location].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:location)))
  end
end
