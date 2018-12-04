# frozen_string_literal: true

shared_examples_for 'event_date' do
  it 'has event_date' do
    expect(stubby.event_date).to eq(['2012'])
  end
  it 'has event_date predicate' do
    expect(rdf.should(include('http://rs.tdwg.org/dwc/terms/eventDate')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:event_date)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:event_date].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:event_date)))
  end
end
