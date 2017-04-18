# frozen_string_literal: true

shared_examples_for 'generic_qualifier' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has qualifier' do
    expect(stubby.qualifier).to eq('order of the phoenix')
  end
  it 'has qualifier predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#qualifier')))
  end
end
