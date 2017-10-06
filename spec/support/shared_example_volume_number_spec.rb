# frozen_string_literal: true

shared_examples_for 'volume_number' do
  it 'has volume number' do
    expect(stubby.volume_number).to eq(['volume_number_test'])
  end
  it 'has volume number predicate' do
    expect(rdf.should(include('http://schema.org/volumeNumber')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:volume_number)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:volume_number].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:volume_number)))
  end
end
