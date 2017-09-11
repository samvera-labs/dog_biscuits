# frozen_string_literal: true

shared_examples_for 'refereed' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has refereed' do
    expect(stubby.refereed).to eq([true])
  end
  it 'has refereed predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#refereed')))
  end
end
