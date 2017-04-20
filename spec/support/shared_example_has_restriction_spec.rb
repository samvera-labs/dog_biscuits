# frozen_string_literal: true

shared_examples_for 'has_restriction' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has restriction' do
    expect(stubby.has_restriction).to eq(['10 years from last access'])
  end
  it 'has restriction predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.loc.gov/premis/rdf/v1#hasRestriction')))
  end
end
