# frozen_string_literal: true

shared_examples_for 'managing_organisation' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:org) { FactoryGirl.build(:organisation) }

  before do
    stubby.managing_organisation_resource << org
  end
  it 'has managing organisation' do
    expect(stubby.managing_organisation_resource.first).to eq(org)
  end
  it 'has managing organisation predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureManagingUnit')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('managing_organisation_label_tesim')))
  end
end
