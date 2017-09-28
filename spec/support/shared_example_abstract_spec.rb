# frozen_string_literal: true

shared_examples_for 'abstract' do
  # the class that includes the concern
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has abstract' do
    expect(stubby.abstract).to eq(['abstract'])
  end

  it 'has abstract predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/abstract')))
  end
end
