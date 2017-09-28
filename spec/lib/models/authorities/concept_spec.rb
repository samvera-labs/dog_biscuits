# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Concept do
  let(:concept_scheme) { FactoryGirl.build(:concept_scheme) }
  let(:scheme1) { FactoryGirl.build_stubbed(:concept_scheme) }
  let(:stubby) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build_stubbed(:broader_concept) }
  let(:concept3) { FactoryGirl.build(:concept) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'is a concept' do
    expect(stubby).to be_concept
  end

  # Concerns
  it_behaves_like 'skos_labels'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'common_labels'
  it_behaves_like 'rdfs_see_also'

  describe '#metadata' do
    specify { stubby.type.should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { stubby.definition.should eq('my definition is this') }
    specify { stubby.note.should eq(['note']) }
    specify { stubby.exact_match.should eq(['uri-to-exact-matching-concept']) }
    specify { stubby.close_match.should eq(['uri-to-close-matching-concept']) }
  end

  describe '#predicates' do
    specify { rdf.should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { rdf.should include('http://www.w3.org/2004/02/skos/core#note') }
    specify { rdf.should include('http://www.w3.org/2004/02/skos/core#exactMatch') }
    specify { rdf.should include('http://www.w3.org/2004/02/skos/core#closeMatch') }
  end

  describe '#related objects' do
    # http://stackoverflow.com/questions/2937326/populating-an-association-with-children-in-factory-girl
    it 'is related to the parent scheme' do
      expect(stubby.concept_scheme.preflabel).to eq('label')
    end

    it 'is a top concept' do
      concept3.top_concept_of << scheme1
      expect(concept3.topconcept?).to be_truthy
    end

    it 'scheme has a top concept' do
      concept3.top_concept_of << scheme1
      expect(scheme1.has_top_concept.first).to eq(concept3)
    end

    it 'is not a top concept' do
      expect(stubby.topconcept?).to be_falsey
    end

    before do
      stubby.broader << concept2
    end

    it 'has broader concept' do
      expect(stubby.broader.first.preflabel).to eq('broader object')
    end

    it 'has narrower concept' do
      expect(concept2.narrower.first.preflabel).to eq('label')
    end
  end
end
