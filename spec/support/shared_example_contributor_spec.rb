# frozen_string_literal: true

shared_examples_for 'contributor' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:contributor) { FactoryGirl.build_stubbed(:person) }

  before do
    stubby.contributor_resource << contributor
  end
  it 'has contributor' do
    expect(stubby.contributor).to eq(['Joyce, Mike'])
  end
  it 'has contributor resource' do
    expect(stubby.contributor_resource.first).to eq(contributor)
  end

  # Don't test for _label in solr - no models use this at the moment
end
