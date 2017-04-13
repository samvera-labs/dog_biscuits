# frozen_string_literal: true

shared_examples_for 'official_url' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has official_url' do
    expect(stubby.official_url).to eq(['http://www.london.ac.uk'])
  end
  it 'has official_url predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#officialUrl')))
  end
end
