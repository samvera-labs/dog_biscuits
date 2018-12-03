# frozen_string_literal: true

shared_examples_for 'funder' do
  it 'has funder' do
    expect(stubby.funder).to eq(['The National Parks Service'])
  end
  it 'has funder predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/fnd')))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr['contributor_combined_tesim'].should(include('The National Parks Service')))
    expect(stubby.to_solr['contributor_type_sim'].should(include('funder')))
  end
  it 'is in the solr_document' do
    expect(solr_doc.should respond_to(:funder))
  end
  
  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:funder].should be_truthy)
  end
  
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should include(:funder))
  end
end
