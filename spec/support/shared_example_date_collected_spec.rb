# frozen_string_literal: true

shared_examples_for 'date_collected' do
  it 'has date collected' do
    expect(stubby.date_collected).to eq(['2012'])
  end

  it 'has date collected predicate' do
    expect(rdf.should(include('http://purl.org/spar/fabio/hasDateCollected')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_collected)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_collected].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_collected)))
  end
end
