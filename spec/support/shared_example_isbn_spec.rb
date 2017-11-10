# frozen_string_literal: true

shared_examples_for 'isbn' do
  it 'has isbn' do
    expect(stubby.isbn).to eq(['xxx-xxx-xxx'])
  end
  it 'has isbn predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/isbn')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:isbn)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:isbn].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:isbn)))
  end
end
