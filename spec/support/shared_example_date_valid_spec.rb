# frozen_string_literal: true

shared_examples_for 'date_valid' do
  it 'has date_valid' do
    expect(stubby.date_valid).to eq(['2017-2020'])
  end

  it 'has date_valid predicate' do
    expect(rdf.should(include('ttp://www.loc.gov/mods/rdf/v1#dateValid')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:date_valid)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:date_valid].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:date_valid)))
  end
end
