# frozen_string_literal: true

shared_examples_for 'based_near' do
  # the class that includes the concern
  let(:rdf) { stubby.resource.dump(:ttl) }

  # TODO: create proper test and add to thesis
  it 'has based_near' do
    expect(stubby.based_near).to eq([])
  end

  it 'has predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/basedNear')))
  end
end
