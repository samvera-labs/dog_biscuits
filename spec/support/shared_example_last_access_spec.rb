# frozen_string_literal: true

shared_examples_for 'last_access' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has last_access' do
    expect(stubby.last_access).to eq('2016-01-01')
  end
  it 'has last_access predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#lastAccess')))
  end
end
