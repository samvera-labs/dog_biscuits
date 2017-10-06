# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::ConceptScheme do
  let(:concept) { FactoryGirl.build(:concept) }
  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build_stubbed(:concept) }
  let(:stubby) { FactoryGirl.build(:concept_scheme) }
  let(:scheme1) { FactoryGirl.build_stubbed(:concept_scheme) }
  let(:work) { FactoryGirl.build_stubbed(:thesis) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'skos_labels'
  it_behaves_like 'description'

  it 'is a concept scheme' do
    expect(stubby).to be_concept_scheme
  end

  describe '#rdftypes' do
    specify { stubby.type.should include('http://www.w3.org/2004/02/skos/core#ConceptScheme') }
  end

  describe '#related objects' do
    before do
      stubby.concepts << concept1
      stubby.concepts << concept2
      concept.top_concept_of << scheme1
    end

    it 'has top concept' do
      expect(scheme1.has_top_concept.to_a.size).to eq(1)
    end

    it 'has two concepts' do
      expect(stubby.concepts.to_a.size).to eq(2)
    end
  end
end
