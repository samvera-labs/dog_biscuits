# frozen_string_literal: true

shared_examples_for 'advisor' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:person) { FactoryGirl.build_stubbed(:person) }

  before do
    stubby.advisor_resource << person
  end

  it 'has advisor string and resource' do
    expect(stubby.advisor).to eq(['Rourke, Andy'])
  end

  it 'has advisor resource' do
    expect(stubby.advisor_resource.first).to eq(person)
  end

  it 'has advisor resource predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/ths')))
  end
  it 'has advisor predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#advisor')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('advisor_label_tesim')))
  end

  it 'has contributor in solr' do
    expect(stubby.to_solr.should(include('contributor_label_tesim')))
  end
end
