# frozen_string_literal: true

shared_examples_for 'awarding_institution' do
  it 'has awarding institution resource' do
    expect(stubby.awarding_institution).to eq(['Awarding Institution'])
  end

  it 'has an awarding institution predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/grantingInstitution')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:awarding_institution)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:awarding_institution].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:awarding_institution)))
  end
end
