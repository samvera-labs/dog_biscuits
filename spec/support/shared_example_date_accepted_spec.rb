# frozen_string_literal: true

shared_examples_for 'date_accepted' do
  it 'has date accepted' do
    expect(stubby.date_accepted).to eq(['2014'])
  end
  it 'has date accepted predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/dateAccepted')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_accepted)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_accepted].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_accepted)))
  end
end
