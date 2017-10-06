# frozen_string_literal: true

shared_examples_for 'rdf_type' do
  before do
    stubby.rdf_type << 'http://www.w3.org/2004/02/skos/core#' + model_str
  end
  it 'has rdf type' do
    expect(stubby.rdf_type).to eq(['http://www.w3.org/2004/02/skos/core#' + model_str])
  end
  it 'has rdf type predicate' do
    expect(rdf.should(include('<> a')))
  end
end
