# frozen_string_literal: true

shared_examples_for 'language' do
  it 'has language' do
    expect(stubby.language).to eq(['English'])
  end
  it 'has language predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/language')))
  end

  it 'has language code' do
    expect(stubby.language_code).to eq(['en-GB'])
  end
  it 'has language code predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/language')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:language)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:language].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:language)))
  end
end
