# frozen_string_literal: true

shared_examples_for 'managing_organisation' do
  # the class that includes the concern

  let(:org) { FactoryGirl.build(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  before do
    stubby.managing_organisation_resource << org
  end
  it 'has managing organisation' do
    expect(stubby.managing_organisation_resource.first).to eq(org)
  end
  it 'has managing organisation predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/pure#pureManagingUnit')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['managing_organisation_label_tesim'].should(eq([org.preflabel])))
  end
end
