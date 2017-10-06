# frozen_string_literal: true

shared_examples_for 'date_of_award' do
  # metadata
  it 'has date of award' do
    expect(stubby.date_of_award).to eq(['2016-01-01'])
  end

  # predicates
  it 'has date of award predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/dateAccepted')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_of_award)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_of_award].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_of_award)))
  end
end
