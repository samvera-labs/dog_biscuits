# frozen_string_literal: true

shared_examples_for 'description' do
  it 'has description' do
    expect(stubby.description).to eq(['description'])
  end
  it 'has description predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/description')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:description))) if stubby.work?
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:description].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:description))) if stubby.work?
  end
end
