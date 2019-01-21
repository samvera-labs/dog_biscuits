# frozen_string_literal: true

shared_examples_for 'height' do
  it 'has height' do
    expect(stubby.height).to eq(['55cm'])
  end

  it 'has height predicate' do
    expect(rdf.should(include('http://www.w3.org/2003/12/exif/ns#height')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:height)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:height].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:height)))
  end
end
