# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Group do
  let(:stubby) { FactoryBot.build(:group) }
  let(:scheme) { FactoryBot.build_stubbed(:concept_scheme) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'foaf_name'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'generic_qualifier'
  it_behaves_like 'hub_dates'
  it_behaves_like 'related_authority'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'skos_labels'
  it_behaves_like 'skos_note'

  it 'is a group' do
    expect(stubby).to be_group
  end

  describe '#metadata' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Group') }
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Agent') }
    specify { stubby.group_type.should eq(['group type']) }
    specify { stubby.foaf_member.should eq(['member']) }
  end

  it 'gets a label from name parts' do
    stubby.add_label
    expect(stubby.rdfs_label).to eq('The Smiths, 1500-1550, order of the phoenix')
  end
  it 'gets preflabel from rdfs label' do
    stubby.add_label
    expect(stubby.preflabel).to eq('The Smiths, 1500-1550, order of the phoenix')
  end

  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(stubby.concept_scheme).to be_a(DogBiscuits::ConceptScheme)
    end
  end

  describe '#predicates' do
    specify { rdf.should include('http://dlib.york.ac.uk/ontologies/generic#groupType') }
    specify { rdf.should include('http://xmlns.com/foaf/0.1/member') }
  end
end
