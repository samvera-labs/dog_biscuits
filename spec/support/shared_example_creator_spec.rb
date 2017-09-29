# frozen_string_literal: true

shared_examples_for 'creator' do
  # the class that includes the concern
  model_str = described_class.to_s.split('::')[1]

  let(:rdf) { stubby.resource.dump(:ttl) }

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
end
