# frozen_string_literal: true

shared_examples_for 'date_created' do
  it 'has date created' do
    expect(stubby.date_created).to eq(['2015-01-01'])
  end
  it 'has date accepted predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/created')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_created)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_created].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_created)))
  end
end
