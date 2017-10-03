# frozen_string_literal: true

shared_examples_for 'presented_at' do
  # the class that includes the concern
  let(:conference) { FactoryGirl.build_stubbed(:event) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
end
