# frozen_string_literal: true

shared_examples_for 'rdfs_label' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has rdfs label' do
    expect(stubby.rdfs_label).to eq('Not Factory')
  end
  it 'has rdfs label' do
    expect(rdf.should(include('http://www.w3.org/2000/01/rdf-schema#label')))
  end
end
