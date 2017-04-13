# frozen_string_literal: true

shared_examples_for 'publication_status' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has publication_status' do
    expect(stubby.publication_status).to eq('Published')
  end
  it 'has status predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/ontology/bibo/status')))
  end
end
