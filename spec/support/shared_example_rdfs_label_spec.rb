# frozen_string_literal: true

shared_examples_for 'rdfs_label' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has rdfs label' do
    expect(stubby.rdfs_label).to eq('Not Factory')
  end
  it 'has rdfs label' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.w3.org/2000/01/rdf-schema#label')))
  end
end
