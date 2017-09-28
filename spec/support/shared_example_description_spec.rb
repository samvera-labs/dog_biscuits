# frozen_string_literal: true

shared_examples_for 'description' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has description' do
    expect(stubby.description).to eq(['description'])
  end
  it 'has description predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/description')))
  end
end
