# frozen_string_literal: true

shared_examples_for 'advisor' do

  it 'has advisor string' do
    expect(stubby.advisor).to eq(['Rourke, Andy'])
  end

  it 'has advisor predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/ths')))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr['contributor_combined_tesim'].should(include('Rourke, Andy', person.preflabel)))
    expect(stubby.to_solr['contributor_type_sim'].should(include('advisor')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:advisor)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:advisor].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:advisor)))
  end
end
