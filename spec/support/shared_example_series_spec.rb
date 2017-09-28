# frozen_string_literal: true

shared_examples_for 'series' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has series' do
    expect(stubby.series).to eq(['The Woeful Series'])
  end
  it 'has series predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/hasSeries')))
  end
end
