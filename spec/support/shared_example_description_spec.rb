# frozen_string_literal: true

shared_examples_for 'description' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has description' do
    expect(stubby.description).to eq(['description'])
  end
  it 'has description predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/description')))
  end
end
