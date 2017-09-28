# frozen_string_literal: true

shared_examples_for 'skos_note' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has note' do
    expect(stubby.note).to eq(['note'])
  end

  it 'has note predicate' do
    expect(rdf.should(include('http://www.w3.org/2004/02/skos/core#note')))
  end
end
