# frozen_string_literal: true

shared_examples_for 'keyword' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has keyword' do
    expect(stubby.keyword).to eq(['northern misery'])
  end
  it 'has keywords predicate' do
    expect(rdf.should(include('http://schema.org/keywords')))
  end
end
