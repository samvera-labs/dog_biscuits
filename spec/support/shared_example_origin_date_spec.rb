# frozen_string_literal: true

shared_examples_for 'origin_date' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has origin date' do
    expect(stubby.origin_date).to eq(['2012'])
  end

  it 'has origin date predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/originDate')))
  end
end
