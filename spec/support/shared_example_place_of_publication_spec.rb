# frozen_string_literal: true

shared_examples_for 'place_of_publication' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has place_of_publication' do
    expect(stubby.place_of_publication).to eq(['Salford'])
  end
  it 'has place_of_publication predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/providerPlace')))
  end
end
