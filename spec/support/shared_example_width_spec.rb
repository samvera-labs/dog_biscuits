# frozen_string_literal: true

shared_examples_for 'width' do
  it 'has width' do
    expect(stubby.width).to eq(['11cm'])
  end

  it 'has width predicate' do
    expect(rdf.should(include('http://www.w3.org/2003/12/exif/ns#width')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:width)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:width].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:width)))
  end
end
