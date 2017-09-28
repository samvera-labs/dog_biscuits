# frozen_string_literal: true

shared_examples_for 'part' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has part' do
    expect(stubby.part).to eq(['Part One'])
  end
  it 'has part predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/part')))
  end
end
