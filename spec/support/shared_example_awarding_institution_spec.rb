# frozen_string_literal: true

shared_examples_for 'awarding_institution' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:org) { FactoryGirl.build_stubbed(:organisation) }

  before do
    stubby.awarding_institution_resource << org
  end

  it 'has awarding institution resource' do
    expect(stubby.awarding_institution_resource.first).to eq(org)
  end

  it 'has will have an awarding institution predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('awarding_institution_label_tesim')))
  end
end
