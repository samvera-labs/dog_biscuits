# frozen_string_literal: true

shared_examples_for 'skos_labels' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has preflabel' do
    expect(stubby.preflabel).to eq('label')
  end
  it 'has altlabel' do
    expect(stubby.altlabel).to eq(['alternative label'])
  end
  it 'has altLabel predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#altLabel')))
  end
  it 'has prefLabel predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.w3.org/2004/02/skos/core#prefLabel')))
  end
end
