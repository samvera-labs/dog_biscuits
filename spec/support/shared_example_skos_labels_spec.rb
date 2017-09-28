# frozen_string_literal: true

shared_examples_for 'skos_labels' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has preflabel' do
    expect(stubby.preflabel).to eq('label')
  end
  it 'has altlabel' do
    expect(stubby.altlabel).to eq(['alternative label'])
  end
  it 'has altLabel predicate' do
    expect(rdf.should(include('http://www.w3.org/2004/02/skos/core#altLabel')))
  end
  it 'has prefLabel predicate' do
    expect(rdf.should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
  end
end
