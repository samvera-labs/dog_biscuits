# frozen_string_literal: true

shared_examples_for 'dc_format' do
  it 'has dc_format' do
    expect(stubby.dc_format).to eq(['vinyl'])
  end
  it 'has dc_format predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/format')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:dc_format))) if stubby.work?
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:dc_format].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:dc_format))) if stubby.work?
  end
end
