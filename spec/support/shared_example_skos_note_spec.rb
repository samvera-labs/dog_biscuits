# frozen_string_literal: true

shared_examples_for 'skos_note' do
  it 'has note' do
    expect(stubby.note).to eq(['note'])
  end

  it 'has note predicate' do
    expect(rdf.should(include('http://www.w3.org/2004/02/skos/core#note')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:note))) if stubby.work?
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:note].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:note))) if stubby.work?
  end
end
