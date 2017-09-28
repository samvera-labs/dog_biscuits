# frozen_string_literal: true

shared_examples_for 'rdf_type' do
  let(:model_str) { described_class.to_s.split('::')[1] }
  let(:stubby) { FactoryGirl.build(model_str.underscore.to_sym) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
