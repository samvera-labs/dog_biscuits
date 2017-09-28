# frozen_string_literal: true

shared_examples_for 'module_code' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has former module code' do
    expect(stubby.module_code).to eq(['XXXXXX'])
  end
  it 'has module code predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#moduleCode')))
  end
end
