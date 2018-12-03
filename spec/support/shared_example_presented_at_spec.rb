# frozen_string_literal: true

shared_examples_for 'presented_at' do
  it 'has conference' do
    expect(stubby.presented_at).to eq(['The International Conference of Misery'])
  end
  
  it 'has presented at predicate' do
    expect(rdf.should(include('http://purl.org/ontology/bibo/presentedAt')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:presented_at)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:presented_at].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:presented_at)))
  end
end
