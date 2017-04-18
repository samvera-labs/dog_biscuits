# frozen_string_literal: true

shared_examples_for 'funder' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:funder) { FactoryGirl.build_stubbed(:organisation) }

  before do
    stubby.funder_resource << funder
  end
  it 'has funder' do
    expect(stubby.funder_resource.first).to eq(funder)
  end
  it 'has funder predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/fnd')))
  end
end
