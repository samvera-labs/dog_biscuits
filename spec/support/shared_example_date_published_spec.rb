# frozen_string_literal: true

shared_examples_for 'date_published' do
  it 'has date_published' do
    expect(stubby.date_published).to eq(['2016'])
  end
  it 'has date published predicate' do
    expect(rdf.should(include('http://schema.org/datePublished')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_published)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_published].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_published)))
  end
end
