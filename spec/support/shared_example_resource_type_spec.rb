# frozen_string_literal: true

shared_examples_for 'resource_type' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has resource type' do
    expect(stubby.resource_type).to eq(['Software'])
  end
  it 'has type predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/type')))
  end
end
