# frozen_string_literal: true

shared_examples_for 'former_identifier' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has former identifier' do
    expect(stubby.former_id).to eq(['york:1234'])
  end
  it 'has former identifier predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#formerIdentifier')))
  end
end
