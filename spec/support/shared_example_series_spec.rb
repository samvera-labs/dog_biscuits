# frozen_string_literal: true

shared_examples_for 'series' do
  it 'has series' do
    expect(stubby.series).to eq(['The Woeful Series'])
  end
  it 'has series predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/hasSeries')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:series)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:series].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:series)))
  end
end
