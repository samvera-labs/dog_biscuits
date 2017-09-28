# frozen_string_literal: true

shared_examples_for 'qualification' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  # metadata
  it 'has qualification name' do
    expect(stubby.qualification_name).to eq(['qualification'])
  end
  it 'has an qualification level' do
    expect(stubby.qualification_level).to eq(['PhD'])
  end

  # predicates
  it 'has qualification level predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'has qualification name predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationName>')))
  end
end
