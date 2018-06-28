# frozen_string_literal: true

shared_examples_for 'date_updated' do
  it 'has date_updated' do
    expect(stubby.date_updated).to eq(['2018'])
  end

  it 'has date_updated predicate' do
    expect(rdf.should(include('http://schema.org/dateModified')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_updated)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_updated].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_updated)))
  end
end
