# frozen_string_literal: true

shared_examples_for 'bibliographic_citation' do
  it 'has bibliographic_citation' do
    expect(stubby.bibliographic_citation).to eq(['NME, 6(2), 1984'])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/bibliographicCitation')))
  end
end
