# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Group do
  let(:group) { FactoryGirl.build(:group) }
  let(:scheme) { FactoryGirl.build_stubbed(:concept_scheme) }

  it_behaves_like 'foaf_name'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'generic_qualifier'
  it_behaves_like 'hub_dates'
  it_behaves_like 'mads_related_authority'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'skos_labels'
  it_behaves_like 'skos_note'

  it 'is a group' do
    expect(group).to be_group
  end

  describe '#metadata' do
    specify { group.type.should include('http://xmlns.com/foaf/0.1/Group') }
    specify { group.type.should include('http://xmlns.com/foaf/0.1/Agent') }
    specify { group.group_type.should eq(['group type']) }
    specify { group.foaf_member.should eq(['member']) }
  end

  it 'gets a label from name parts' do
    group.add_label
    expect(group.rdfs_label).to eq('name, 1500-1550, order of the phoenix')
  end
  it 'gets preflabel from rdfs label' do
    group.add_label
    expect(group.preflabel).to eq('name, 1500-1550, order of the phoenix')
  end

  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(group.concept_scheme).to be_a(DogBiscuits::ConceptScheme)
    end
  end

  describe '#predicates' do
    specify { group.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#groupType') }
    specify { group.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/member') }
  end
end
