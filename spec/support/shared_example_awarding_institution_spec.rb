# frozen_string_literal: true

shared_examples_for 'awarding_institution' do
  let(:org) { FactoryGirl.build_stubbed(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  before do
    org.add_label
    stubby.awarding_institution_resource << org
  end

  it 'has awarding institution resource' do
    expect(stubby.awarding_institution_resource.first).to eq(org)
  end

  it 'has will have an awarding institution predicate' do
    expect(rdf.should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['awarding_institution_label_tesim'].should(eq([org.preflabel])))
  end
end
