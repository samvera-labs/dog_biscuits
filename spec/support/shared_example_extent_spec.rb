# frozen_string_literal: true

shared_examples_for 'extent' do
  it 'has extent' do
    expect(stubby.extent).to eq(['500 files'])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/extent')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:extent)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:extent].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:extent)))
  end
end
