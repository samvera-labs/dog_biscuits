# frozen_string_literal: true

shared_examples_for 'creator' do
  model_str = described_class.to_s.split('::')[1]

  if model_str == 'ExamPaper'
    let(:creator) { FactoryGirl.build_stubbed(:organisation) }

  else
    let(:creator) { FactoryGirl.build_stubbed(:person) }
  end

  before do
    creator.add_label
    stubby.creator_resource << creator
  end

  it 'has creator' do
    expect(stubby.creator).to eq(['Marr, Johnny'])
  end
  it 'has creator resource' do
    expect(stubby.creator_resource.first).to eq(creator)
  end
  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/creator')))
  end
  it 'has resource predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/cre')))
  end
  it 'has _label in solr' do
    expect(stubby.to_solr['creator_label_tesim'].should(include('Marr, Johnny', creator.preflabel)))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:creator)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:creator].should(be_truthy))
  end

  # TODO: label
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:creator)))
  end
end
