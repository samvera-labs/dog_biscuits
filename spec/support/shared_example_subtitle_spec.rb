# frozen_string_literal: true

shared_examples_for 'subtitle' do
  it 'has subtitle' do
    expect(stubby.subtitle).to eq(['Work is a four-letter word'])
  end
  it 'has subtitle predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/subtitle')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:subtitle)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:subtitle].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:subtitle)))
  end
end
