# frozen_string_literal: true

shared_examples_for 'isbn' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has isbn' do
    expect(stubby.isbn).to eq(['xxx-xxx-xxx'])
  end
  it 'has isbn predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/identifiers/isbn')))
  end
end
