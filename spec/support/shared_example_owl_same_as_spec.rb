# frozen_string_literal: true

shared_examples_for 'owl_same_as' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has same as' do
    expect(stubby.same_as).to eq(%w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212])
  end
  it 'has same as predicate' do
    expect(rdf.should(include('http://www.w3.org/2002/07/owl#sameAs')))
  end
end
