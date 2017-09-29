# frozen_string_literal: true

shared_examples_for 'source' do
  # the class that includes the concern
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has source' do
    expect(stubby.source).to eq(['tomato'])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/source')))
  end
end
