# frozen_string_literal: true

shared_examples_for 'keyword' do
  it 'has keyword' do
    expect(stubby.keyword).to eq(['northern misery'])
  end
  it 'has keywords predicate' do
    expect(rdf.should(include('http://schema.org/keywords')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:keyword)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:keyword].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:keyword)))
  end
end
