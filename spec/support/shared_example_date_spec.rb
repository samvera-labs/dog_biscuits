# frozen_string_literal: true

shared_examples_for 'date' do
  # Date is never used directly

  before do
    stubby.combine_dates
  end

  it 'has date' do
    expect(stubby.date).to eq(['2016-01-01'])
  end
  it 'has date predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/date')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date].should(be_truthy))
  end
end
