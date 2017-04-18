# frozen_string_literal: true

shared_examples_for 'foaf_name' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has name' do
    expect(stubby.name).to eq('name')
  end
  it 'has name predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/name')))
  end
end
