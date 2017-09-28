# frozen_string_literal: true

shared_examples_for 'advisor' do
  let(:person) { FactoryGirl.build_stubbed(:person) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  before do
    person.add_label
    stubby.advisor_resource << person
  end

  it 'has advisor string' do
    expect(stubby.advisor).to eq(['Rourke, Andy'])
  end

  it 'has advisor resource' do
    expect(stubby.advisor_resource.first).to eq(person)
  end

  it 'has advisor resource predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/ths')))
  end
  it 'has advisor predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#advisor')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['advisor_label_tesim'].should(include('Rourke, Andy', person.preflabel)))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr['contributor_label_tesim'].should(include('Rourke, Andy', person.preflabel)))
  end
end
