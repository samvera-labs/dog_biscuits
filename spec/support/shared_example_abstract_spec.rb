# frozen_string_literal: true

shared_examples_for 'abstract' do
  it 'has abstract' do
    expect(stubby.abstract).to eq(['abstract'])
  end

  it 'has abstract predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/abstract')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:abstract)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:abstract].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:abstract)))
  end
end
