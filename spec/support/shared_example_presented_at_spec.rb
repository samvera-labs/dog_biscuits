# frozen_string_literal: true

shared_examples_for 'presented_at' do
  let(:conference) { FactoryGirl.build_stubbed(:event) }

  before do
    conference.add_label
    stubby.presented_at_resource << conference
  end
  it 'has conference' do
    expect(stubby.presented_at).to eq(['The International Conference of Misery'])
  end
  it 'has conference resource' do
    expect(stubby.presented_at_resource).to eq([conference])
  end
  it 'has presented at predicate' do
    expect(rdf.should(include('http://purl.org/ontology/bibo/presentedAt')))
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#presentedAtConference')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['presented_at_label_tesim'].should(include('The International Conference of Misery', conference.preflabel)))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:presented_at)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:presented_at].should(be_truthy))
  end

  # TODO: label
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:presented_at)))
  end
end
