# frozen_string_literal: true

shared_examples_for 'place_of_publication' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has place_of_publication' do
    expect(stubby.place_of_publication).to eq(['Salford'])
  end
  it 'has place_of_publication predicate' do
    expect(rdf.should(include('http://bibframe.org/vocab/providerPlace')))
  end
end
